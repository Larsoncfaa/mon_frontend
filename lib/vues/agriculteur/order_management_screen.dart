import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../fournisseurs/provider/order_provider.dart';
import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/error_widget.dart';

class OrderManagementScreen extends ConsumerStatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  ConsumerState<OrderManagementScreen> createState() =>
      _OrderManagementScreenState();
}

class _OrderManagementScreenState
    extends ConsumerState<OrderManagementScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(orderNotifierProvider.notifier);
    final state = ref.read(orderNotifierProvider);

    if (state is AsyncData<PaginatedOrderList>) {
      final page = state.value;
      final hasNext = page.next != null;

      final px = _scrollController.position.pixels;
      final max = _scrollController.position.maxScrollExtent;

      if (px >= max - 200 &&
          hasNext &&
          !notifier.isFetchingMore) {
        notifier.fetchNextPage();
      }
    }
  }

  Future<void> _confirmDelete(BuildContext context, int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Supprimer la commande ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Cette action est irréversible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await ref
          .read(orderNotifierProvider.notifier)
          .deleteOrder(id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Commande supprimée'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncOrders = ref.watch(orderNotifierProvider);
    final notifier = ref.read(orderNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Gestion des commandes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.refresh,
              color: Colors.black,
            ),
            tooltip: 'Actualiser',
            onPressed: () => notifier.refresh(),
          ),
          const Gap(8),
        ],
      ),
      drawer: const AppDrawer(),
      body: asyncOrders.when(
        loading: () => const LoadingWidget(),

        error: (err, _) => ErrorDisplayWidget(
          error: err.toString(),
        ),

        data: (page) {
          final results = page.results;
          final hasNext = page.next != null;

          if (results.isEmpty) {
            return _buildEmptyState();
          }

          final itemCount = results.length + (hasNext ? 1 : 0);

          return RefreshIndicator(
            onRefresh: () => notifier.refresh(),
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: itemCount,
              separatorBuilder: (_, __) => const Gap(16),
              itemBuilder: (context, index) {
                if (index == results.length && hasNext) {
                  return notifier.isFetchingMore
                      ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                      : const SizedBox.shrink();
                }

                final order = results[index];

                return _OrderCard(
                  order: order,
                  onDelete: () => _confirmDelete(
                    context,
                    order.id,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.receipt_2,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const Gap(16),
          const Text(
            'Aucune commande',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Gap(8),
          Text(
            'Les commandes apparaîtront ici.',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 13,
            ),
          ),
          const Gap(24),
          ElevatedButton.icon(
            onPressed: () =>
                ref.read(orderNotifierProvider.notifier).refresh(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Iconsax.refresh),
            label: const Text('Actualiser'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onDelete;

  const _OrderCard({
    required this.order,
    required this.onDelete,
  });

  Color _statusColor() {
    final status = order.orderStatus.name.toLowerCase();

    if (status.contains('completed') ||
        status.contains('delivered') ||
        status.contains('livr')) {
      return Colors.green;
    }

    if (status.contains('cancel') ||
        status.contains('refus') ||
        status.contains('reject')) {
      return Colors.redAccent;
    }

    if (status.contains('pending') ||
        status.contains('attente')) {
      return Colors.orange;
    }

    return Colors.blue;
  }

  String _formatDate() {
    final date = order.dateOrdered.toLocal();

    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day/$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Iconsax.receipt_2,
            color: Colors.blue,
          ),
        ),

        title: Text(
          'Commande #${order.id}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Client ID : ${order.client}',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),
              const Gap(3),
              Text(
                'Date : ${_formatDate()}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              const Gap(3),
              Text(
                'Total : ${order.total.toStringAsFixed(2)} FCFA',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        trailing: PopupMenuButton(
          icon: const Icon(
            Iconsax.more,
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          itemBuilder: (ctx) => [
            PopupMenuItem(
              enabled: false,
              child: Row(
                children: [
                  Icon(
                    Iconsax.status,
                    size: 18,
                    color: statusColor,
                  ),
                  const Gap(12),
                  Text(
                    order.orderStatus.name,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              onTap: onDelete,
              child: const Row(
                children: [
                  Icon(
                    Iconsax.trash,
                    size: 18,
                    color: Colors.red,
                  ),
                  Gap(12),
                  Text(
                    'Supprimer',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}