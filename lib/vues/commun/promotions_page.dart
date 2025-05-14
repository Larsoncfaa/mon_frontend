import 'package:flutter/material.dart';

class PromotionsPage extends StatelessWidget {
  final List<Map<String, dynamic>> promos = [
    {
      "code": "MAY10",
      "description": "10% de réduction sur tout le panier",
      "valide_jusqu": "31/05/2025",
    },
    {
      "code": "FRAISPORT",
      "description": "Livraison gratuite pour les commandes > 10 000 CFA",
      "valide_jusqu": "15/06/2025",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promotions disponibles"),
      ),
      body: ListView.builder(
        itemCount: promos.length,
        itemBuilder: (context, index) {
          final promo = promos[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                promo["code"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("${promo["description"]}\nValide jusqu’au : ${promo["valide_jusqu"]}"),
              isThreeLine: true,
              trailing: Icon(Icons.local_offer, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
