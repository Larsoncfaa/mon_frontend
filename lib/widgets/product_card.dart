import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../models/product_discount.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final ProductDiscount? discount;
  final Future<void> Function()? onAddToCart; // <- asynchrone maintenant

  const ProductCard({
    Key? key,
    required this.product,
    this.discount,
    this.onAddToCart,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLoading = false;

  double get discountedPrice {
    if (widget.discount == null || widget.product.sellingPrice == null) {
      return widget.product.sellingPrice ?? 0;
    }
    return (widget.product.sellingPrice!) * (1 - widget.discount!.discountPercent / 100);
  }

  Future<void> _handleAddToCart() async {
    if (widget.onAddToCart == null) return;

    setState(() => isLoading = true);
    try {
      await widget.onAddToCart!();
      if (mounted) {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (_) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 48),
                const SizedBox(height: 12),
                Text(
                  '${widget.product.name} a été ajouté au panier !',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // Ferme la bottom sheet
                  },
                  icon: const Icon(Icons.done),
                  label: const Text('Continuer'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // Ferme la bottom sheet
                    Navigator.pushNamed(context, '/cart'); // Navigue vers le panier
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Voir le panier'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                ),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final discount = widget.discount;
    final hasDiscount = discount != null && product.sellingPrice != null;

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
                Text(product.name, style: Theme.of(context).textTheme.titleMedium),
                Text('Unité : ${product.unit.label}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
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
                    '${product.sellingPrice!.toStringAsFixed(2)}€',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                const Spacer(),

                // Bouton ajouter au panier
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : _handleAddToCart,
                    icon: isLoading
                        ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                        : const Icon(Icons.add_shopping_cart),
                    label: Text(isLoading ? 'Ajout...' : 'Ajouter au panier'),
                  ),
                ),
              ],
            ),
          ),

          // Badge réduction
          if (hasDiscount)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '-${discount!.discountPercent.toStringAsFixed(0)}%',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
    child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
  );
}
