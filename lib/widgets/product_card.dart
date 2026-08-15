import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/product.dart';
import '../../models/product_discount.dart';
import '../../fournisseurs/provider/client_profile_provider.dart';
import '../../fournisseurs/provider/product_review_provider.dart';

class ProductCard extends ConsumerStatefulWidget {
  final Product product;
  final ProductDiscount? discount;

  const ProductCard({
    super.key,
    required this.product,
    this.discount,
  });

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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                        ),
                        child: product.image != null
                            ? Image.network(
                                product.image!,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => _imagePlaceholder(),
                              )
                            : _imagePlaceholder(),
                      ),
                      if (hasDiscount)
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '-${discount.discountPercent.toStringAsFixed(0)}%',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Gap(4),
                      Text(
                        'Unité: ${product.unit.label}',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                      ),
                      const Gap(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (hasDiscount) ...[
                                Text(
                                  '${product.sellingPrice?.toStringAsFixed(0)} F',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '${discountedPrice.toStringAsFixed(0)} F',
                                  style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.green, fontSize: 18),
                                ),
                              ] else
                                Text(
                                  '${product.sellingPrice?.toStringAsFixed(0) ?? "0"} F',
                                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                                ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green.shade600,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Iconsax.add, color: Colors.white, size: 20),
                          ),
                        ],
                      ),
                      if (canLeaveReview) ...[
                        const Gap(12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/ajouter-avis', arguments: widget.product.id);
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              side: BorderSide(color: Colors.grey.shade200),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            icon: const Icon(Iconsax.star, size: 16),
                            label: const Text('Donner un avis', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            
            // Subtle overlay for better tap feedback if needed
            PositionMaterial(
              onTap: () {
                 Navigator.pushNamed(context, '/product-detail', arguments: product);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() => Center(
    child: Icon(Iconsax.image, size: 40, color: Colors.grey.shade300),
  );
}

class PositionMaterial extends StatelessWidget {
  final VoidCallback onTap;
  const PositionMaterial({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.black.withValues(alpha: 0.03),
          highlightColor: Colors.transparent,
        ),
      ),
    );
  }
}
