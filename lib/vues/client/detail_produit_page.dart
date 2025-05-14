// lib/vues/client/detail_produit_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../donnees/produit.dart';
import '../../fournisseurs/produits/produit_details_provider.dart';
import '../../widgets/bouton_large.dart';
import '../../utils/format.dart';

class DetailProduitPage extends ConsumerStatefulWidget {
  final int produitId;
  const DetailProduitPage({Key? key, required this.produitId}) : super(key: key);

  @override
  ConsumerState<DetailProduitPage> createState() => _DetailProduitPageState();
}

class _DetailProduitPageState extends ConsumerState<DetailProduitPage> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR'); // on parle en français par défaut
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _lire(String texte) async {
    await _tts.speak(texte);
  }

  @override
  Widget build(BuildContext context) {
    final detailsAsync = ref.watch(produitDetailsProvider(widget.produitId));

    return Scaffold(
      appBar: AppBar(title: const Text('Détail du produit')),
      body: detailsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (Produit p) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Carousel d’images
              if (p.images.isNotEmpty) ...[
                CarouselSlider(
                  items: p.images
                      .map((url) => Image.network(url,
                      fit: BoxFit.cover, width: double.infinity))
                      .toList(),
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Nom et description
              Text(
                p.nomLocalise,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              Text(p.descriptionLocalisee),
              const SizedBox(height: 16),

              // Prix
              Text(
                'Prix : ${formatMonnaie(p.prixUnitaire)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // QR code
              Center(
                child: QrImage(
                  data: p.id.toString(),
                  version: QrVersions.auto,
                  size: 150.0,
                ),
              ),
              const SizedBox(height: 24),

              // Bouton Ajouter au panier
              BoutonLarge(
                texte: 'Ajouter au panier',
                onPressed: () {
                  _lire(p.nomLocalise);
                  ref
                      .read(panierProvider.notifier)
                      .ajouter(p, 1);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Produit ajouté au panier')),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
