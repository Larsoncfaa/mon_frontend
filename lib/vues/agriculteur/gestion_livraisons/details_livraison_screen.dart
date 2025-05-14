import 'package:flutter/material.dart';

class DetailsLivraisonScreen extends StatelessWidget {
  final String idCommande;

  const DetailsLivraisonScreen({super.key, required this.idCommande});

  @override
  Widget build(BuildContext context) {
    // Exemple statique de détails
    final Map<String, dynamic> livraison = {
      'client': 'Awa Traoré',
      'adresse': 'Sogoniko, Bamako',
      'etat': 'en_cours',
      'etapes': ['Préparée', 'En route', 'En cours de livraison'],
      'preuve': 'non',
    };

    return Scaffold(
      appBar: AppBar(title: Text('Commande $idCommande')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitre('Client'),
            Text(livraison['client'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),

            _sectionTitre('Adresse'),
            Text(livraison['adresse'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            _sectionTitre('Suivi de livraison'),
            _timelineLivraison(livraison['etapes']),
            const SizedBox(height: 16),

            _sectionTitre('Carte (livraison simulée)'),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(child: Text('🗺️ Carte GPS (à intégrer)')),
            ),
            const SizedBox(height: 16),

            _sectionTitre('Preuve de livraison'),
            livraison['preuve'] == 'non'
                ? const Text('📸 Aucune preuve fournie.')
                : const Text('✅ Livraison validée avec preuve.'),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Valider livraison (photo ou signature)'),
              onPressed: () {
                // 🖋️ Action pour prendre photo / faire signer
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitre(String titre) {
    return Text(titre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget _timelineLivraison(List<String> etapes) {
  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children:
      etapes.map((e) => Row(
  children: [
  const Icon(Icons.check_circle, color: Colors.blue),
  const SizedBox(width: 8),
  Text(e, style: const TextStyle(fontSize: 16)),
  ],
  ))
      .toList(),
  );
  }
}
