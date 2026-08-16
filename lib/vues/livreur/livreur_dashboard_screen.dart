import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../fournisseurs/provider/delivery_provider.dart';
import '../../models/delivery.dart';
import 'delivery_list_screen.dart';
import 'tracking_map_screen.dart';

class LivreurDashboardScreen extends ConsumerWidget {
  const LivreurDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliveryNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Livreur Hub', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.profile_circle, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
          const Gap(12),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _buildError(e.toString()),
        data: (deliveries) {
          return RefreshIndicator(
            onRefresh: () => ref.read(deliveryNotifierProvider.notifier).fetchDeliveries(),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                _buildSummary(deliveries),
                const Gap(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Livraisons Actives', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DeliveryListScreen())),
                      child: const Text('Voir tout'),
                    ),
                  ],
                ),
                const Gap(12),
                if (deliveries.isEmpty)
                  _buildEmptyState()
                else
                  ...deliveries.take(5).map((d) => _DeliveryCard(delivery: d)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummary(List<Delivery> deliveries) {
    final int pending = deliveries.where((d) => d.deliveryStatus == DeliveryStatusEnum.EN_ATTENTE).length;
    final int inProgress = deliveries.where((d) => d.deliveryStatus == DeliveryStatusEnum.EN_COURS).length;
    final int completed = deliveries.where((d) => d.deliveryStatus == DeliveryStatusEnum.TERMINEE).length;

    return Row(
      children: [
        _StatItem(label: 'En attente', count: pending, color: Colors.orange, icon: Iconsax.timer_1),
        const Gap(12),
        _StatItem(label: 'En cours', count: inProgress, color: Colors.blue, icon: Iconsax.truck_fast),
        const Gap(12),
        _StatItem(label: 'Terminé', count: completed, color: Colors.green, icon: Iconsax.tick_circle),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Icon(Iconsax.box_remove, size: 48, color: Colors.grey.shade300),
          const Gap(16),
          const Text('Aucune mission assignée', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(child: Text('Erreur : $error', style: const TextStyle(color: Colors.red)));
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final int count;
  final Color color;
  final IconData icon;

  const _StatItem({required this.label, required this.count, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const Gap(8),
            Text('$count', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: color)),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color.withValues(alpha: 0.7))),
          ],
        ),
      ),
    );
  }
}

class _DeliveryCard extends StatelessWidget {
  final Delivery delivery;
  const _DeliveryCard({required this.delivery});

  @override
  Widget build(BuildContext context) {
    final status = delivery.deliveryStatus;
    final bool canTrack = status == DeliveryStatusEnum.EN_COURS && delivery.latitude != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: _getStatusColor(status).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(14)),
              child: Icon(_getStatusIcon(status), color: _getStatusColor(status)),
            ),
            title: Text('Commande #${delivery.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Statut: ${status?.name ?? "N/A"}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
            trailing: canTrack
                ? IconButton(
                    icon: const Icon(Iconsax.map_1, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TrackingMapScreen(
                        deliveryId: delivery.id,
                        latitude: delivery.latitude,
                        longitude: delivery.longitude,
                      )));
                    },
                  )
                : const Icon(Iconsax.arrow_right_3, size: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(DeliveryStatusEnum? status) {
    switch (status) {
      case DeliveryStatusEnum.EN_ATTENTE: return Colors.orange;
      case DeliveryStatusEnum.EN_COURS: return Colors.blue;
      case DeliveryStatusEnum.TERMINEE: return Colors.green;
      default: return Colors.grey;
    }
  }

  IconData _getStatusIcon(DeliveryStatusEnum? status) {
    switch (status) {
      case DeliveryStatusEnum.EN_ATTENTE: return Iconsax.clock;
      case DeliveryStatusEnum.EN_COURS: return Iconsax.truck_fast;
      case DeliveryStatusEnum.TERMINEE: return Iconsax.tick_circle;
      default: return Iconsax.info_circle;
    }
  }
}
