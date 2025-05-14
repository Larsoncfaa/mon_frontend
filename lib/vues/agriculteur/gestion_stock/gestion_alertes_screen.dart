import 'package:flutter/material.dart';

class GestionAlertesScreen extends StatelessWidget {
  const GestionAlertesScreen({super.key});

  // ⚠️ Exemple de données simulées
  final List<Map<String, dynamic>> alertes = const [
    {
      'produit': 'Oignons rouges',
      'quantite': 8,
      'seuil': 10,
      'entrepot': 'Entrepôt central',
    },
    {
      'produit': 'Tomates',
      'quantite': 3,
      'seuil': 15,
      'entrepot': 'Dépôt ouest',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🚨 Alertes de stock')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alertes.length,
        itemBuilder: (context, index) {
          final alerte = alertes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.red.shade50,
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.red),
              title: Text(
                alerte['produit'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Quantité : ${alerte['quantite']} / Seuil : ${alerte['seuil']}\nEntrepôt : ${alerte['entrepot']}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Forcer vérification',
                onPressed: () {
                  // 🔁 Appel POST /alerts/{id}/check/ ici
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✅ Vérification forcée envoyée'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
