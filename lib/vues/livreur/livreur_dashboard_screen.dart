// 📁 lib/screens/livreur_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/delivery_provider.dart';


class LivreurDashboardScreen extends ConsumerWidget {
  const LivreurDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliveryNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tableau de bord Livreur')),
      body: state.when(
        loading:  () => const Center(child: CircularProgressIndicator()),
        error:    (e,_) => Center(child: Text('Erreur : $e')),
        data:     (list) {
          // Compte par statut
          final counts = <String,int>{};
          for (var d in list) {
            final key = d.deliveryStatus?.name ?? 'Inconnu';
            counts[key] = (counts[key] ?? 0) + 1;
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: counts.entries.map((e) {
                return Card(
                  child: ListTile(
                    leading: Icon(_iconForStatus(e.key)),
                    title:  Text(e.key),
                    trailing: Text('${e.value}'),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  IconData _iconForStatus(String status) {
    switch (status) {
      case 'EN_ATTENTE': return Icons.schedule;
      case 'EN_COURS':   return Icons.delivery_dining;
      case 'TERMINEE':   return Icons.check_circle;
      default:           return Icons.help_outline;
    }
  }
}
