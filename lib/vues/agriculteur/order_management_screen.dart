// lib/screens/agriculteur/order_management_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/order_provider.dart';
import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/error_widget.dart';

class OrderManagementScreen extends ConsumerStatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  ConsumerState<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends ConsumerState<OrderManagementScreen> {
  final _scrollController = ScrollController();

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
      if (px >= max - 200 && hasNext && !notifier.isFetchingMore) {
        notifier.fetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncOrders = ref.watch(orderNotifierProvider);
    final notifier = ref.read(orderNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Gestion des commandes')),
      drawer: const AppDrawer(),
      body: asyncOrders.when(
        loading: () => const LoadingWidget(),
        error: (err, _) => ErrorDisplayWidget(error: err.toString()),
        data: (page) {
          // Extrait la liste dans une variable non-nullable
          final results = page.results ?? <Order>[];
          final hasNext = page.next != null;
          final itemCount = results.length + (hasNext ? 1 : 0);

          return RefreshIndicator(
            onRefresh: () => notifier.refresh(),
            child: ListView.separated(
              controller: _scrollController,
              itemCount: itemCount,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (ctx, index) {
                // Loader en dernière position si besoin
                if (index == results.length && hasNext) {
                  return notifier.isFetchingMore
                      ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  )
                      : const SizedBox.shrink();
                }

                final order = results[index];
                return Dismissible(
                  key: ValueKey(order.id),
                  background: const ColoredBox(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
                  onDismissed: (_) async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Supprimer la commande'),
                        content: const Text('Voulez-vous vraiment supprimer cette commande ?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, false),
                            child: const Text('Annuler'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, true),
                            child: const Text('Supprimer'),
                          ),
                        ],
                      ),
                    );

                    if (confirmed == true) {
                      await notifier.deleteOrder(order.id);
                      notifier.refresh();
                    } else {
                      // Réinsère l'élément si l'utilisateur annule la suppression
                      setState(() {});
                    }
                  },
                  child: ListTile(
                    title: Text('Commande #${order.id}'),
                    subtitle: Text(
                      'Client : ${order.client.user}\n'
                          'Date : ${order.dateOrdered.toLocal().toString().split(" ")[0]}\n'
                          'Total : ${order.total.toStringAsFixed(2)} FCFA',
                    ),
                    trailing: Text(order.orderStatus?.name ?? '—'),
                    onTap: () {
                      // TODO: détails / modification
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
