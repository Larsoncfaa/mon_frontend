// 📦 lib/screens/client/tracking_map_screen.dart

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingMapScreen extends StatelessWidget {
  final int deliveryId;
  final double? latitude;
  final double? longitude;

  const TrackingMapScreen({
    super.key,
    required this.deliveryId,
    this.latitude,
    this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    LatLng? position;
    if (latitude != null && longitude != null) {
      position = LatLng(latitude!, longitude!);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Suivi de la livraison")),
      body: position != null
          ? GoogleMap(
        initialCameraPosition: CameraPosition(target: position, zoom: 14.5),
        markers: {
          Marker(
            markerId: const MarkerId('livreur'),
            position: position,
            infoWindow: const InfoWindow(title: 'Livreur'),
          ),
        },
      )
          : const Center(child: Text("Position du livreur indisponible.")),
    );
  }
}
