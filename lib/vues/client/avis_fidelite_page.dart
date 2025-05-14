import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../donnees/avis.dart';
import '../../donnees/fidelite.dart';
import '../../fournisseurs/avis/avis_provider.dart';
import '../../fournisseurs/fidelite/fidelite_provider.dart';
import '../../widgets/bouton_large.dart';
import '../../utils/format.dart';

class AvisFidelitePage extends ConsumerStatefulWidget {
  const AvisFidelitePage({super.key});

  @override
  ConsumerState<AvisFidelitePage> createState() => _AvisFidelitePageState();
}

class _AvisFidelitePageState extends ConsumerState<AvisFidelitePage> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
    _tts.speak('Voici vos points de fidélité et vos avis');
  }

  Future<void> _parler(String msg) async => await _tts.speak(msg);

  @override
  Widget build(BuildContext context) {
    final fideliteAsync = ref.watch(fideliteProvider);
    final avisAsync = ref.watch(listeAvisProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Avis & Fidélité')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Solde fidélité
            fideliteAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erreur fidélité : $e'),
              data: (Fidelite f) => Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.loyalty, size: 32, color: Colors.orange),
                    const SizedBox(width: 12),
                    Text('Vous avez ${f.points} points', style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Historique des avis
            Text('Mes avis récents', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 12),
            avisAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erreur avis : $e'),
              data: (List<Avis> liste) {
                if (liste.isEmpty) {
                  return const Text('Vous n\'avez pas encore laissé d\'avis');
                }
                return Column(
                  children: liste.map((avis) => Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(avis.produitNom),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(5, (i) => Icon(
                                i < avis.note ? Icons.star : Icons.star_border,
                                color: Colors.amber, size: 20)),
                          ),
                          const SizedBox(height: 4),
                          Text(avis.commentaire),
                        ],
                      ),
                    ),
                  )).toList(),
                );
              },
            ),

            const SizedBox(height: 24),
            BoutonLarge(
              texte: 'Laisser un avis',
              onPressed: () {
                _parler('Choisissez un produit pour laisser un avis');
                // TODO: naviguer vers le sélecteur de produit à noter
              },
            ),
          ],
        ),
      ),
    );
  }
}
