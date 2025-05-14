import 'package:flutter/material.dart';

class EcranApprovisionnements extends StatelessWidget {
  const EcranApprovisionnements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lots & Entrepôts"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Naviguer vers ajout lot
        },
        icon: const Icon(Icons.add_box),
        label: const Text("Ajouter un lot"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Mes entrepôts",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ..._listeEntrepots(),
          const SizedBox(height: 24),
          const Text(
            "Historique des lots",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ..._listeLots(),
        ],
      ),
    );
  }

  List<Widget> _listeEntrepots() {
    return [
      Card(
        child: ListTile(
          leading: const Icon(Icons.warehouse),
          title: const Text("Entrepôt Central"),
          subtitle: const Text("Bamako - Zone industrielle"),
          trailing: const Icon(Icons.edit),
          onTap: () {
            // Modifier entrepôt
          },
        ),
      ),
      Card(
        child: ListTile(
          leading: const Icon(Icons.warehouse_outlined),
          title: const Text("Annexe Ségou"),
          subtitle: const Text("Route RN6"),
          trailing: const Icon(Icons.edit),
        ),
      ),
    ];
  }

  List<Widget> _listeLots() {
    return [
      Card(
        elevation: 2,
        child: ListTile(
          leading: const Icon(Icons.inventory_2),
          title: const Text("Lot #120"),
          subtitle: const Text("Produit: Maïs | Quantité: 300kg"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.date_range, size: 16),
              Text("03 Mai 2025", style: TextStyle(fontSize: 12)),
            ],
          ),
          onTap: () {
            // Détails du lot
          },
        ),
      ),
      Card(
        elevation: 2,
        child: ListTile(
          leading: const Icon(Icons.inventory_2_outlined),
          title: const Text("Lot #118"),
          subtitle: const Text("Produit: Riz | Quantité: 500kg"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.date_range, size: 16),
              Text("28 Avril 2025", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    ];
  }
}
