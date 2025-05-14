import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EcranLivraisonsClient extends StatefulWidget {
  const EcranLivraisonsClient({super.key});

  @override
  State<EcranLivraisonsClient> createState() => _EcranLivraisonsClientState();
}

class _EcranLivraisonsClientState extends State<EcranLivraisonsClient> {
  late GoogleMapController _carteCtrl;

  final List<Map<String, String>> livraisons = [
    {"id": "#00124", "status": "Livrée", "preuve": "Photo"},
    {"id": "#00125", "status": "En route", "preuve": "GPS"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes livraisons")),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: GoogleMap(
              onMapCreated: (controller) => _carteCtrl = controller,
              initialCameraPosition: const CameraPosition(
                target: LatLng(12.6392, -8.0029),
                zoom: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: livraisons.length,
              itemBuilder: (context, index) {
                final item = livraisons[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text("Commande ${item['id']}"),
                    subtitle: Text("Statut : ${item['status']}"),
                    trailing: Text(item['preuve']!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
