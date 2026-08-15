import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

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
      _showMessage("Chargement du panier en cours...", isError: true);
      return;
    }

    setState(() => isLoading = true);

    try {
      await ref.read(cartItemNotifierProvider.notifier).addCartItem(
        productId: product.id,
        quantity: quantity,
      );
      _showMessage('${product.name} ajouté au panier');
    } catch (e) {
      _showMessage("Erreur lors de l'ajout au panier", isError: true);
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _showMessage(String msg, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError ? Colors.redAccent : Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(product),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleSection(product),
                  const Gap(24),
                  _buildInfoChips(product),
                  const Gap(32),
                  if (product.description != null) ...[
                    const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Gap(8),
                    Text(product.description!, style: TextStyle(color: Colors.grey.shade600, height: 1.6)),
                    const Gap(32),
                  ],
                  _buildQuantitySelector(),
                  const Gap(100), // Space for bottom bar
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomAction(),
    );
  }

  Widget _buildSliverAppBar(Product product) {
    return SliverAppBar(
      expandedHeight: 350,
      pinned: true,
      backgroundColor: Colors.green,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (product.image != null)
              Image.network(product.image!, fit: BoxFit.cover)
            else
              Container(color: Colors.grey.shade100, child: const Icon(Iconsax.image, size: 64, color: Colors.grey)),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ],
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(icon: const Icon(Iconsax.arrow_left_2, color: Colors.black), onPressed: () => Navigator.pop(context)),
        ),
      ),
    );
  }

  Widget _buildTitleSection(Product product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Gap(4),
              Text('Unité : ${product.unit.label}', style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Text(
          '${product.sellingPrice?.toStringAsFixed(0) ?? "0"} F',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.green),
        ),
      ],
    );
  }

  Widget _buildInfoChips(Product product) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (product.quantityInStock != null)
          _InfoChip(icon: Iconsax.archive_1, label: '${product.quantityInStock} en stock', color: Colors.blue),
        if (product.expirationDate != null)
          _InfoChip(icon: Iconsax.calendar_1, label: 'Exp: ${DateFormat('dd/MM/yyyy').format(product.expirationDate!)}', color: Colors.orange),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Quantité', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            children: [
              _QtyBtn(icon: Iconsax.minus, onTap: _decrementQuantity),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('$quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _QtyBtn(icon: Iconsax.add, onTap: _incrementQuantity),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, -5))],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : _addToCart,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.shopping_cart),
                  const Gap(12),
                  Text('Ajouter au panier • ${(widget.product.sellingPrice! * quantity).toStringAsFixed(0)} F', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _InfoChip({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const Gap(6),
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}

class _QtyBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
