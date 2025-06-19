import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/notifications/auth_notifier.dart';
import '../../../../fournisseurs/provider/product_review_provider.dart';
import '../../../../models/product_review.dart';
import '../../../../models/rating_enum.dart';

class AjouterAvisScreen extends ConsumerStatefulWidget {
  final int productId;

  const AjouterAvisScreen({super.key, required this.productId});

  @override
  _AjouterAvisScreenState createState() => _AjouterAvisScreenState();
}

class _AjouterAvisScreenState extends ConsumerState<AjouterAvisScreen> {
  final TextEditingController _commentController = TextEditingController();
  RatingEnum? _selectedRating;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Laisser un Avis')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: authState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Erreur : $err')),
          data: (user) {
            if (user == null) {
              return const Center(child: Text("Aucun utilisateur connecté."));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Évaluez ce produit", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                _buildRatingSelector(),
                const SizedBox(height: 24),
                TextField(
                  controller: _commentController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Ajouter un commentaire (facultatif)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => _submitReview(user.id),
                  child: const Text('Soumettre mon avis'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildRatingSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: RatingEnum.values.map((rating) {
        return IconButton(
          icon: Icon(
            _selectedRating == rating ? Icons.star : Icons.star_border,
            color: Colors.orange,
          ),
          onPressed: () {
            setState(() {
              _selectedRating = rating;
            });
          },
        );
      }).toList(),
    );
  }

  Future<void> _submitReview(int clientId) async {
    if (_selectedRating == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez choisir une note")),
      );
      return;
    }

    // 🔍 Vérifie s’il existe déjà un avis pour ce produit
    final existingReviews = ref.read(productReviewNotifierProvider).value ?? [];
    ProductReview? existingReview;
    try {
      existingReview = existingReviews.firstWhere((r) => r.product == widget.productId);
    } catch (_) {
      existingReview = null;
    }

    final newReview = ProductReview(
      id: existingReview?.id ?? 0,
      product: widget.productId,
      rating: _selectedRating!,
      comment: _commentController.text.trim(),
      createdAt: existingReview?.createdAt ?? DateTime.now(),
      verifiedPurchase: true,
    );

    try {
      if (existingReview != null) {
        await ref.read(productReviewNotifierProvider.notifier).updateReview(newReview);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Votre avis a été mis à jour.")),
        );
      } else {
        await ref.read(productReviewNotifierProvider.notifier).addReview(newReview);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Avis soumis avec succès !")),
        );
      }

      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur : ${e.toString()}")),
      );
    }
  }

}
