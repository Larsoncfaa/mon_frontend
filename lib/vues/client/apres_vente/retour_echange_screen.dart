import 'package:flutter/material.dart';

class RetourEchangeScreen extends StatefulWidget {
  final String idCommande;

  const RetourEchangeScreen({super.key, required this.idCommande});

  @override
  State<RetourEchangeScreen> createState() => _RetourEchangeScreenState();
}

class _RetourEchangeScreenState extends State<RetourEchangeScreen> {
  String? typeDemande;
  final TextEditingController raisonCtrl = TextEditingController();

  void _envoyerDemande() {
    if (typeDemande == null || raisonCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    // TODO: Envoyer la demande via l’API : /returns/, /exchanges/, /refunds/
    print("Demande $typeDemande envoyée : ${raisonCtrl.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service Après-Vente')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Type de demande',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: [
                _boutonType('Retour', Icons.undo),
                _boutonType('Échange', Icons.swap_horiz),
                _boutonType('Remboursement', Icons.money_off),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Raison (facultatif mais recommandé)',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: raisonCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Expliquez votre problème...',
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _envoyerDemande,
              icon: const Icon(Icons.send),
              label: const Text('Envoyer ma demande'),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boutonType(String label, IconData icône) {
  final bool actif = typeDemande == label.toLowerCase();
  return ChoiceChip(
  label: Row(
  mainAxisSize: MainAxisSize.min,
  children: [Icon(icône, size: 20), const SizedBox(width: 6), Text(label)],
  ),
  selected: actif,
  onSelected: (_) => setState(() => typeDemande = label.toLowerCase()),
  );
  }
}
