import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class EcranFidelite extends ConsumerWidget {
  const EcranFidelite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = 120; // À remplacer par un provider plus tard
    final historique = [
      {"type": "Achat", "points": 20, "date": "12/05/2025"},
      {"type": "Avis", "points": 5, "date": "10/05/2025"},
      {"type": "Commande", "points": 15, "date": "08/05/2025"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Programme de fidélité'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _cartePoints(points),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Historique', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: historique.length,
              itemBuilder: (context, index) {
                final item = historique[index];
                return ListTile(
                  leading: const Icon(Iconsax.gift),
                  title: Text(item['type']!),
                  subtitle: Text(item['date']!),
                  trailing: Text("+${item['points']} pts", style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartePoints(int points) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Icon(Iconsax.crown, size: 48, color: Colors.white),
            const SizedBox(height: 12),
            const Text('Mes points fidélité', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            Text('$points pts',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
