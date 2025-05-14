import 'package:flutter/material.dart';

class CarteStock extends StatelessWidget {
  final String produitNom;
  final int quantite;
  final String unite;

  const CarteStock({
    super.key,
    required this.produitNom,
    required this.quantite,
    this.unite = 'pcs',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.inventory_2_outlined, color: Colors.blueGrey),
        title: Text(produitNom, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Quantité : $quantite $unite'),
      ),
    );
  }
}
