import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcranAccueilClient extends StatelessWidget {
  const EcranAccueilClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Accueil")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _carteSolde(2300),
            const SizedBox(height: 24),
            _actionsRapides(context),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Commandes récentes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: _listeCommandesRecentes()),
          ],
        ),
      ),
    );
  }

  Widget _carteSolde(int points) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF81C784),
      child: ListTile(
        leading: const Icon(Iconsax.card, size: 36, color: Colors.white),
        title: const Text("Mes points fidélité", style: TextStyle(color: Colors.white)),
        subtitle: Text("$points pts", style: const TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }

  Widget _actionsRapides(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _action(Iconsax.shop, "Catalogue"),
        _action(Iconsax.shopping_cart, "Panier"),
        _action(Iconsax.gift, "Promos"),
      ],
    );
  }

  Widget _action(IconData icone, String titre) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.green.shade200,
          child: Icon(icone, size: 28, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(titre, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _listeCommandesRecentes() {
    final commandes = [
      {"id": "#00124", "statut": "Livrée", "date": "10/05/2025"},
      {"id": "#00120", "statut": "En cours", "date": "12/05/2025"},
    ];

    return ListView.builder(
      itemCount: commandes.length,
      itemBuilder: (context, index) {
        final cmd = commandes[index];
        return ListTile(
          leading: const Icon(Iconsax.bag_tick),
          title: Text("Commande ${cmd['id']}"),
          subtitle: Text("${cmd['statut']} le ${cmd['date']}"),
          trailing: Icon(
            cmd['statut'] == "Livrée" ? Icons.check_circle : Icons.timelapse,
            color: cmd['statut'] == "Livrée" ? Colors.green : Colors.orange,
          ),
        );
      },
    );
  }
}
