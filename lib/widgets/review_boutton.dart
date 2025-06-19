import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product_review.dart';
import '../fournisseurs/provider/product_review_provider.dart';
import '../models/rating_enum.dart';

class LeaveReviewButton extends ConsumerWidget {
  final int productId;

  const LeaveReviewButton({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(productReviewNotifierProvider.notifier);
    final state = ref.watch(productReviewNotifierProvider);

    final hasAlreadyReviewed = state.when(
      data: (reviews) => reviews.any((r) => r.product == productId),
      loading: () => true,
      error: (_, __) => false,
    );

    return ElevatedButton.icon(
      icon: const Icon(Icons.rate_review),
      label: const Text("Laisser un avis"),
      onPressed: hasAlreadyReviewed
          ? null
          : () async {
        final review = ProductReview(
          id: 0, // Ignoré à la création
          product: productId,
          rating: RatingEnum.five, // ou autre choix
          comment: "Super produit !",
          createdAt: DateTime.now(),
          verifiedPurchase: true,
        );

        try {
          await notifier.addReview(review);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Avis ajouté avec succès ✅")),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Erreur : ${e.toString()}")),
            );
          }
        }
      },
    );
  }
}
