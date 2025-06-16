import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/cart_item_provider.dart';
import '../../fournisseurs/provider/cart_provider.dart';
import '../../models/product.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;
  bool isLoading = false;

  void _incrementQuantity() {
    final maxStock = widget.product.quantityInStock;
    if (maxStock == null || quantity < maxStock) {
      setState(() => quantity++);
    }
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() => quantity--);
    }
  }

  Future<void> _addToCart() async {
    final product = widget.product;
    final cartAsync = ref.read(cartStateProvider);

    if (cartAsync is! AsyncData || cartAsync.value == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Chargement du panier en cours...")),
        );
      }
      return;
    }

    setState(() => isLoading = true);

    try {
      await ref.read(cartItemNotifierProvider.notifier).addCartItem(
        productId: product.id,
        quantity: quantity,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${product.name} ajouté au panier')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erreur lors de l'ajout au panier")),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image produit
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: product.image != null
                  ? Image.network(
                product.image!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.broken_image)),
                ),
              )
                  : Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.image_not_supported)),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),

            Text(
              '${product.sellingPrice?.toStringAsFixed(2)} FCFA',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            if (product.description != null && product.description!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                ],
              ),

            Wrap(
              runSpacing: 8,
              spacing: 16,
              children: [
                _DetailTile(title: 'Unité', value: product.unit.name.toUpperCase()),
                if (product.quantityInStock != null)
                  _DetailTile(title: 'Stock', value: '${product.quantityInStock}'),
                if (product.expirationDate != null)
                  _DetailTile(
                    title: 'Date expiration',
                    value: _formatDate(product.expirationDate!),
                  ),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Quantité :", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: const Icon(Icons.remove_circle),
                ),
                Text('$quantity', style: const TextStyle(fontSize: 16)),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: const Icon(Icons.add_circle),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            onPressed: isLoading ? null : _addToCart,
            icon: isLoading
                ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
                : const Icon(Icons.add_shopping_cart),
            label: isLoading ? const Text('Ajout...') : const Text('Ajouter au panier'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

class _DetailTile extends StatelessWidget {
  final String title;
  final String value;

  const _DetailTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$title: $value'),
      backgroundColor: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
