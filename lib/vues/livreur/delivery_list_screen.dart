// 📁 lib/screens/delivery_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/delivery_provider.dart';
import 'delivery_detail_screen.dart';


class DeliveryListScreen extends ConsumerWidget {
  const DeliveryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliveryNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Livraisons')),
      body: state.when(
        loading:  () => const Center(child: CircularProgressIndicator()),
        error:    (e,_) => Center(child: Text('Erreur : $e')),
        data:     (list) {
          if (list.isEmpty) {
            return const Center(child: Text('Aucune livraison trouvée.'));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              final d = list[i];
              return ListTile(
                leading: Icon(_iconForStatus(d.deliveryStatus?.name)),
                title:   Text('Livraison #${d.id}'),
                subtitle: Text('Commande : ${d.order}'),
                trailing: Text(d.deliveryStatus?.name ?? ''),
                onTap:    () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DeliveryDetailScreen(delivery: d),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  IconData _iconForStatus(String? status) {
    switch (status) {
      case 'EN_ATTENTE': return Icons.schedule;
      case 'EN_COURS':   return Icons.delivery_dining;
      case 'TERMINEE':   return Icons.check_circle;
      default:           return Icons.help_outline;
    }
  }
}
