import 'package:flutter/material.dart';
import '../donnees/produit.dart';
import '../utils/format.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CarteProduit extends StatelessWidget {
  final Produit produit;
  final VoidCallback onTap;

  const CarteProduit({super.key, required this.produit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final tts = FlutterTts();
    return GestureDetector(
      onTap: () {
        tts.speak(produit.nom);
        onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(produit.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produit.nom, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(formatMonnaie(produit.prix)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
