import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../fournisseurs/provider/delivery_person_provider.dart';
import '../../fournisseurs/provider/delivery_provider.dart';
import '../../models/delivery.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/error_widget.dart';
import 'forme/create_delivery_person_screen.dart';

class DeliveryManagementScreen extends ConsumerWidget {
  const DeliveryManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveriesAsync = ref.watch(deliveryNotifierProvider);
    final pagedDeliveryPersonsAsync = ref.watch(deliveryPersonNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Logistique', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'Ajouter un livreur',
            icon: const Icon(Iconsax.user_add, color: Colors.green),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreateDeliveryPersonScreen())),
          ),
          const Gap(8),
        ],
      ),
      drawer: const AppDrawer(),
      body: deliveriesAsync.when(
        data: (deliveries) {
          if (deliveries.isEmpty) return _buildEmptyState();
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: deliveries.length,
            separatorBuilder: (_, __) => const Gap(16),
            itemBuilder: (context, i) => _DeliveryCard(delivery: deliveries[i]),
          );
        },
        loading: () => const LoadingWidget(),
        error: (e, _) => ErrorDisplayWidget(error: e.toString()),
      ),
      bottomNavigationBar: _buildBottomPagination(context, ref, pagedDeliveryPersonsAsync),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.truck_fast, size: 64, color: Colors.grey.shade300),
          const Gap(16),
          const Text('Aucune livraison active', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBottomPagination(BuildContext context, WidgetRef ref, AsyncValue pagedDeliveryPersonsAsync) {
    return pagedDeliveryPersonsAsync.maybeWhen(
      data: (page) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -2))]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: page.previous != null ? () => ref.read(deliveryPersonNotifierProvider.notifier).loadPrevious() : null,
              icon: const Icon(Iconsax.arrow_left_2),
            ),
            Text('${page.results.length} livreurs actifs', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            IconButton(
              onPressed: page.next != null ? () => ref.read(deliveryPersonNotifierProvider.notifier).loadNext() : null,
              icon: const Icon(Iconsax.arrow_right_3),
            ),
          ],
        ),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}

class _DeliveryCard extends ConsumerWidget {
  final Delivery delivery;
  const _DeliveryCard({required this.delivery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = delivery.deliveryStatus;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: _getTypeColor(delivery.type).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                  child: Icon(_getTypeIcon(delivery.type), color: _getTypeColor(delivery.type), size: 20),
                ),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Livraison #${delivery.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(DateFormat('dd MMM yyyy').format(delivery.createdAt), style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                    ],
                  ),
                ),
                _StatusBadge(status: status),
              ],
            ),
            const Gap(16),
            Text(delivery.description, style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
            const Gap(20),
            Row(
              children: [
                if (status == DeliveryStatusEnum.EN_ATTENTE)
                  _ActionButton(
                    label: 'Lancer',
                    icon: Iconsax.play,
                    color: Colors.blue,
                    onTap: () => ref.read(deliveryNotifierProvider.notifier).startDelivery(delivery.id),
                  ),
                if (status == DeliveryStatusEnum.EN_COURS)
                  _ActionButton(
                    label: 'Terminer',
                    icon: Iconsax.tick_circle,
                    color: Colors.green,
                    onTap: () => ref.read(deliveryNotifierProvider.notifier).completeDelivery(delivery.id),
                  ),
                const Gap(8),
                _ActionButton(
                  label: 'Réassigner',
                  icon: Iconsax.user_edit,
                  color: Colors.grey,
                  onTap: () {}, // Logic from original screen to be kept
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTypeIcon(TypeEnum type) {
    switch (type) {
      case TypeEnum.LIVRAISON: return Iconsax.truck;
      case TypeEnum.STOCK: return Iconsax.box;
      case TypeEnum.REMBOURSEMENT: return Iconsax.money_send;
      default: return Iconsax.info_circle;
    }
  }

  Color _getTypeColor(TypeEnum type) {
    switch (type) {
      case TypeEnum.LIVRAISON: return Colors.orange;
      case TypeEnum.STOCK: return Colors.blue;
      case TypeEnum.REMBOURSEMENT: return Colors.purple;
      default: return Colors.grey;
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final DeliveryStatusEnum? status;
  const _StatusBadge({this.status});

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
      child: Text(
        status?.name ?? 'N/A',
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }

  Color _getColor() {
    switch (status) {
      case DeliveryStatusEnum.EN_ATTENTE: return Colors.orange;
      case DeliveryStatusEnum.EN_COURS: return Colors.blue;
      case DeliveryStatusEnum.TERMINEE: return Colors.green;
      default: return Colors.grey;
    }
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({required this.label, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withValues(alpha: 0.2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: color),
              const Gap(8),
              Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
