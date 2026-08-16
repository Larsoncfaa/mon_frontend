import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../models/order.dart';
import '../../models/order_status_enum.dart';

class OrdersListScreen extends StatelessWidget {
  final List<Order> orders;

  const OrdersListScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Historique Commandes', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: orders.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: orders.length,
              separatorBuilder: (_, __) => const Gap(16),
              itemBuilder: (context, index) {
                final order = orders[index];
                return _OrderCard(order: order);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.receipt_search, size: 64, color: Colors.grey.shade300),
          const Gap(16),
          const Text('Aucune commande passée', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: _getStatusColor(order.orderStatus).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16)),
                child: Icon(Iconsax.receipt_1, color: _getStatusColor(order.orderStatus)),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Commande #${order.id}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Gap(4),
                    Text(DateFormat('dd MMM yyyy').format(order.dateOrdered), style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${order.total.toStringAsFixed(0)} F', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black87)),
                  const Gap(4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: _getStatusColor(order.orderStatus).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      order.orderStatus.name,
                      style: TextStyle(color: _getStatusColor(order.orderStatus), fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.pending: return Colors.orange;
      case OrderStatusEnum.enCours: return Colors.blue;
      case OrderStatusEnum.delivered: return Colors.green;
      case OrderStatusEnum.cancelled: return Colors.red;
      default: return Colors.grey;
    }
  }
}
