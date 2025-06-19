// 📁 lib/screens/livreur_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../fournisseurs/provider/delivery_provider.dart';
import 'delivery_list_screen.dart';
import 'tracking_map_screen.dart'; // ⬅️ à importer

class LivreurDashboardScreen extends ConsumerWidget {
  const LivreurDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliveryNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord Livreur'),
        actions: [IconButton(
          icon: const Icon(Icons.list_alt),
          tooltip: 'Mes livraisons',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DeliveryListScreen(),
              ),
            );
          },
        ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Voir le profil',
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (list) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: list.map((delivery) {
                final status = delivery.deliveryStatus?.name ?? 'Inconnu';
                final isEnCours = status == 'EN_COURS';
                final hasPosition = delivery.latitude != null && delivery.longitude != null;

                return Card(
                  child: ListTile(
                    leading: Icon(_iconForStatus(status)),
                    title: Text('Livraison #${delivery.id} - $status'),
                    subtitle: hasPosition
                        ? const Text('Position disponible')
                        : const Text('Position indisponible'),
                    trailing: isEnCours && hasPosition
                        ? IconButton(
                      icon: const Icon(Icons.map),
                      tooltip: 'Voir sur la carte',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TrackingMapScreen(
                              deliveryId: delivery.id,
                              latitude: delivery.latitude,
                              longitude: delivery.longitude,
                            ),
                          ),
                        );
                      },
                    )
                        : null,
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
      case 'EN_ATTENTE':
        return Icons.schedule;
      case 'EN_COURS':
        return Icons.delivery_dining;
      case 'TERMINEE':
        return Icons.check_circle;
      default:
        return Icons.help_outline;
    }
  }
}
