// 📁 lib/screens/order_history_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/order_provider.dart';






class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Historique des commandes')),
      body: state.when(
        loading:  () => const Center(child: CircularProgressIndicator()),
        error:    (e,_) => Center(child: Text('Erreur : $e')),
        data:     (page) {
          final orders = page.results;
          if (orders!.isEmpty) {
            return const Center(child: Text('Aucune commande trouvée.'));
          }
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (ctx,i) {
              final o = orders[i];
              return ListTile(
                title:    Text('Commande #${o.id}'),
                subtitle: Text('Montant : ${o.total.toStringAsFixed(2)} €'),
                trailing: Text(o.orderStatus?.name ?? ''),
                onTap:    () => Navigator.pushNamed(context, '/orders/${o.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
