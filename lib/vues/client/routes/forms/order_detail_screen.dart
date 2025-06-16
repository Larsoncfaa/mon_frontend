import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/provider/order_line_provider.dart';
import '../../../../fournisseurs/provider/order_provider.dart';


class OrderDetailScreen extends ConsumerWidget {
  final int orderId;
  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderByIdProvider(orderId));
    final linesAsync = ref.watch(orderLineNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Commande #$orderId')),
      body: orderAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:   (e,_) => Center(child: Text('Erreur : $e')),
        data:    (order) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Client: ${order.client.id}'),
                subtitle: Text('Total: ${order.total.toStringAsFixed(2)} €'),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Lignes de commande', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: linesAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error:   (e,_) => Center(child: Text('Erreur lignes: $e')),
                  data:    (lines) {
                    final filtered = lines.where((l) => l.product.id == orderId);
                    return ListView(
                      children: filtered.map((l) => ListTile(
                        title: Text(l.product.name),
                        subtitle: Text('Quantité: ${l.quantity}'),
                        trailing: Text('${(l.unitPrice ?? 0).toStringAsFixed(2)} f'),
                      )).toList(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
