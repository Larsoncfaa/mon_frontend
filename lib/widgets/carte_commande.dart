import 'package:flutter/material.dart';
import '../donnees/commande.dart';
import '../utils/format.dart';

class CarteCommande extends StatelessWidget {
  final Commande commande;
  final VoidCallback onTap;

  const CarteCommande({super.key, required this.commande, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text('Commande #${commande.id}'),
        subtitle: Text('Date : ${formatDate(commande.date)}\nTotal : ${formatMonnaie(commande.lignes.fold(0, (sum, l) => sum + l.prix * l.quantite))}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
