// 📁 lib/screens/delivery_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:maliag/vues/livreur/tracking_map_screen.dart';

import '../../models/delivery.dart';


class DeliveryDetailScreen extends StatelessWidget {
  final Delivery delivery;
  const DeliveryDetailScreen({super.key, required this.delivery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Livraison #${delivery.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Commande : ${delivery.order}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Type : ${delivery.type.name}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Statut : ${delivery.deliveryStatus?.name ?? 'Inconnu'}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Description : ${delivery.description}', style: const TextStyle(fontSize: 14)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TrackingMapScreen(deliveryId: delivery.id, latitude: null, longitude: null,),
                  ),
                );
              },
              icon: const Icon(Icons.map),
              label: const Text('Suivre la livraison'),
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
            ),

          ],
        ),
      ),
    );
  }
}
