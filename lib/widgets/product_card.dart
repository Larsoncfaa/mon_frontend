import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product.dart';
import '../../models/product_discount.dart';
import '../../fournisseurs/provider/client_profile_provider.dart';
import '../../fournisseurs/provider/product_review_provider.dart';

class ProductCard extends ConsumerStatefulWidget {
  final Product product;
  final ProductDiscount? discount;

  const ProductCard({
    Key? key,
    required this.product,
    this.discount,
  }) : super(key: key);

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  double get discountedPrice {
    if (widget.discount == null || widget.product.sellingPrice == null) {
      return widget.product.sellingPrice ?? 0;
    }
    return (widget.product.sellingPrice!) *
        (1 - widget.discount!.discountPercent / 100);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final discount = widget.discount;
    final hasDiscount = discount != null && product.sellingPrice != null;

    final client = ref.watch(clientProfileNotifierProvider).value;
    final reviews = ref.watch(productReviewNotifierProvider).maybeWhen(
      data: (data) => data,
      orElse: () => [],
    );

    final alreadyReviewed = reviews.any(
          (r) => r.product == widget.product.id && r.client == client?.id,
    );

    final canLeaveReview = client != null && !alreadyReviewed;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image produit
                if (product.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.image!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _imagePlaceholder(),
                    ),
                  )
                else
                  _imagePlaceholder(),

                const SizedBox(height: 8),

                // Nom
                Text(product.name,
                    style: Theme.of(context).textTheme.titleMedium),
                Text('Unité : ${product.unit.label}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey[600])),
                const SizedBox(height: 4),

                // ✅ Note moyenne désactivée car non définie sur Product
                // if (product.averageRating != null)
                //   Row(
                //     children: [
                //       buildStarRating(product.averageRating!),
                //       const SizedBox(width: 6),
                //       Text(
                //         product.averageRating!.toStringAsFixed(1),
                //         style: TextStyle(color: Colors.grey[800]),
                //       ),
                //     ],
                //   ),

                const SizedBox(height: 4),

                // Prix
                if (hasDiscount)
                  Row(
                    children: [
                      Text(
                        '${product.sellingPrice?.toStringAsFixed(2)}€',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${discountedPrice.toStringAsFixed(2)}€',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                else if (product.sellingPrice != null)
                  Text(
                    '${product.sellingPrice!.toStringAsFixed(2)}fcfa',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                const Spacer(),

                // ✅ Bouton Donner un avis
                if (canLeaveReview)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/ajouter-avis',
                          arguments: widget.product.id,
                        );
                      },
                      icon: const Icon(Icons.rate_review),
                      label: const Text('Donner un avis'),
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),

          // Badge réduction
          if (hasDiscount)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '-${discount!.discountPercent.toStringAsFixed(0)}%',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() => Container(
    height: 120,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(12),
    ),
    alignment: Alignment.center,
    child:
    const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
  );

  Widget buildStarRating(double rating) {
    final fullStars = rating.floor();
    final hasHalfStar = (rating - fullStars) >= 0.5;
    final emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      children: [
        for (var i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.amber, size: 18),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.amber, size: 18),
        for (var i = 0; i < emptyStars; i++)
          const Icon(Icons.star_border, color: Colors.amber, size: 18),
      ],
    );
  }
}
