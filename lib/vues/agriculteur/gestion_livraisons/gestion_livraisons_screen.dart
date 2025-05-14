import 'package:flutter/material.dart';

class GestionLivraisonsScreen extends StatelessWidget {
  const GestionLivraisonsScreen({super.key});

  // 📦 Exemples de commandes à livrer
  final List<Map<String, dynamic>> commandes = const [
    {
      'id': 'CMD-001',
      'client': 'Awa Traoré',
      'adresse': 'Sogoniko, Bamako',
      'etat': 'en_attente',
    },
    {
      'id': 'CMD-002',
      'client': 'Mamadou Diarra',
      'adresse': 'Hamdallaye ACI',
      'etat': 'en_cours',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📦 Gestion des livraisons')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: commandes.length,
        itemBuilder: (context, index) {
          final commande = commandes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.local_shipping, color: Colors.green),
              title: Text('Commande ${commande['id']}'),
              subtitle: Text(
                'Client : ${commande['client']}\nAdresse : ${commande['adresse']}',
              ),
              trailing: _buildEtatLivraison(commande['etat']),
              onTap: () {
                // 👉 Accès à l’écran de détails / suivi GPS
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // 📤 Affectation d’un livreur manuellement ou automatique
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Affecter un livreur'),
              content: const Text('Fonctionnalité à intégrer'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        label: const Text('Affecter'),
        icon: const Icon(Icons.person_add_alt_1),
      ),
    );
  }

  Widget _buildEtatLivraison(String etat) {
    switch (etat) {
      case 'en_attente':
        return const Chip(label: Text('🕒 En attente'), backgroundColor: Colors.orangeAccent);
      case 'en_cours':
        return const Chip(label: Text('🚚 En cours'), backgroundColor: Colors.blueAccent);
      case 'livrée':
        return const Chip(label: Text('✅ Livrée'), backgroundColor: Colors.green);
      default:
        return const SizedBox.shrink();
    }
  }
}
