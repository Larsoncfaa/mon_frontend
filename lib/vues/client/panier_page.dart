// lib/vues/client/panier_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/bouton_large.dart';
import '../../widgets/champ_texte.dart';
import '../../utils/format.dart';
import '../../donnees/produit.dart';
import '../../fournisseurs/panier/panier_provider.dart';

class PanierPage extends ConsumerStatefulWidget {
  const PanierPage({super.key});

  @override
  ConsumerState<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends ConsumerState<PanierPage> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _parler(String message) async {
    await _tts.speak(message);
  }

  String _formatPrix(double montant) => formatMonnaie(montant);

  @override
  Widget build(BuildContext context) {
    final panier = ref.watch(panierProvider);
    final notifier = ref.read(panierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Mon Panier')),
      body: panier.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Votre panier est vide', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            BoutonLarge(
              texte: 'Retour au catalogue',
              onPressed: () {
                _parler('Retour au catalogue');
                Navigator.pushNamed(context, '/client/catalogue');
              },
            )
          ],
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: panier.length,
              itemBuilder: (ctx, i) {
                final item = panier[i];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.produit.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(item.produit.nomLocalise),
                    subtitle: Text(_formatPrix(item.produit.prixUnitaire * item.quantite)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            notifier.modifierQuantite(item.produit, item.quantite - 1);
                            _parler('Quantité diminuée');
                          },
                        ),
                        Text('${item.quantite}', style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {
                            notifier.modifierQuantite(item.produit, item.quantite + 1);
                            _parler('Quantité augmentée');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Total : ${_formatPrix(notifier.montantTotal)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                BoutonLarge(
                  texte: 'Commander',
                  onPressed: () {
                    _parler('Passer la commande');
                    Navigator.pushNamed(context, '/client/paiement');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
