// lib/vues/client/catalogue_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../fournisseurs/produits/produit_liste_provider.dart';
import '../../fournisseurs/produits/categorie_provider.dart';

class CataloguePage extends ConsumerStatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  ConsumerState<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends ConsumerState<CataloguePage> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    // Configure TTS
    _tts.setLanguage('bm'); // Bambara par défaut pour audio-nom
    // Charger catégories et produits initiaux
    ref.read(categorieListProvider.notifier).loadCategories();
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _lecture(String texte) async {
    await _tts.speak(texte);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categorieListProvider);
    final selectedCatId = ref.watch(categorieListProvider.select((s) => s.selectedId));
    final produitsAsync = ref.watch(produitParCategorieProvider(selectedCatId));

    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue')),
      body: Column(
        children: [
          // Barre de catégories
          SizedBox(
            height: 60,
            child: categoriesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Erreur: $e')),
              data: (cats) => ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: cats.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (ctx, i) {
                  final cat = cats[i];
                  final isSel = cat.id == selectedCatId;
                  return ChoiceChip(
                    label: Text(cat.nomLocalise),
                    selected: isSel,
                    onSelected: (_) {
                      ref.read(categorieListProvider.notifier).select(cat.id);
                    },
                  );
                },
              ),
            ),
          ),
          const Divider(height: 1),
          // Grille de produits
          Expanded(
            child: produitsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Erreur: $e')),
              data: (liste) {
                if (liste.isEmpty) {
                  return const Center(child: Text('Aucun produit disponible'));
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: liste.length,
                  itemBuilder: (ctx, idx) {
                    final p = liste[idx];
                    return GestureDetector(
                      onTap: () {
                        _lecture(p.nomBambara);
                        Navigator.pushNamed(
                          ctx,
                          '/client/produit/${p.id}',
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: Image.network(
                                  p.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.nomLocalise,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${p.prixUnitaire.toStringAsFixed(2)} €',
                                    style: const TextStyle(fontSize: 14, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
