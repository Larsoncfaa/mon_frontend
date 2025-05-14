import 'package:flutter/material.dart';

class GestionStockScreen extends StatelessWidget {
  const GestionStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🗃️ Gestion de stock'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: _ResumeStockCard(),
          ),
          const Divider(),
          const Expanded(child: _ListeStockProduits()),
        ],
      ),
    );
  }
}

class _ResumeStockCard extends StatelessWidget {
  const _ResumeStockCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const ListTile(
        leading: Icon(Icons.storage, color: Colors.teal),
        title: Text('Total produits en stock'),
        subtitle: Text('💼 8 produits actifs\n⚠️ 2 alertes de seuil'),
        trailing: Icon(Icons.bar_chart),
      ),
    );
  }
}

class _ListeStockProduits extends StatelessWidget {
  const _ListeStockProduits();

  @override
  Widget build(BuildContext context) {
    final produits = [
      {
        'nom': 'Oignons rouges',
        'entrepot': 'Entrepôt central',
        'quantite': 120,
        'seuil': 100,
        'alerte': false,
      },
      {
        'nom': 'Tomates fraîches',
        'entrepot': 'Magasin BKO',
        'quantite': 45,
        'seuil': 50,
        'alerte': true,
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: produits.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (context, index) {
        final p = produits[index];
        return _CarteProduitStock(
          nom: p['nom'] as String,
          entrepot: p['entrepot'] as String,
          quantite: p['quantite'] as int,
          seuil: p['seuil'] as int,
          alerte: p['alerte'] as bool,
        );
      },
    );
  }
}

class _CarteProduitStock extends StatelessWidget {
  final String nom;
  final String entrepot;
  final int quantite;
  final int seuil;
  final bool alerte;

  const _CarteProduitStock({
    required this.nom,
    required this.entrepot,
    required this.quantite,
    required this.seuil,
    required this.alerte,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: alerte ? Colors.red.shade50 : Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.inventory_2_outlined, color: Colors.blueGrey),
        title: Text(nom, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('📍 $entrepot\n📦 Quantité : $quantite | 🔺 Seuil : $seuil'),
        trailing: alerte
            ? const Icon(Icons.warning_amber, color: Colors.red)
            : const Icon(Icons.check_circle, color: Colors.green),
        onTap: () {
          // Aller au détail du produit ou mouvements
        },
      ),
    );
  }
}
