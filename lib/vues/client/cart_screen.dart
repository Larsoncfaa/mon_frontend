import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../fournisseurs/provider/cart_item_provider.dart';
import '../../fournisseurs/provider/order_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool _isSubmitting = false;

  Future<void> _submitOrder() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Confirmer la commande', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Souhaitez-vous valider votre panier et passer à la commande ?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text('Annuler', style: TextStyle(color: Colors.grey.shade600))),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isSubmitting = true);

    try {
      final order = await ref.read(orderNotifierProvider.notifier).createOrderFromCart();
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('✅ Commande créée avec succès'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );

      Navigator.pushNamed(context, '/order-confirmation', arguments: order);
      ref.read(cartItemNotifierProvider.notifier).fetchCartItems();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Erreur: $e'), backgroundColor: Colors.redAccent),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItemsState = ref.watch(cartItemNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Mon Panier', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: cartItemsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erreur: $err')),
        data: (data) {
          final items = data.results;
          if (items.isEmpty) return _buildEmptyCart();

          final double total = items.fold(0.0, (sum, item) => sum + (item.totalPrice ?? 0.0));

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Gap(16),
                  itemBuilder: (_, i) => _CartItemCard(item: items[i]),
                ),
              ),
              _buildCheckoutSection(total),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.05), shape: BoxShape.circle),
            child: Icon(Iconsax.shopping_cart, size: 64, color: Colors.green.shade200),
          ),
          const Gap(24),
          const Text('Votre panier est vide', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Gap(8),
          Text('Découvrez nos produits frais et remplissez-le !', style: TextStyle(color: Colors.grey.shade500)),
          const Gap(32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            child: const Text('Aller au marché'),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(double total) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, -5))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sous-total', style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
              Text('${total.toStringAsFixed(0)} F', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            ],
          ),
          const Gap(24),
          ElevatedButton(
            onPressed: _isSubmitting ? null : _submitOrder,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: _isSubmitting
                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
                : const Text('Confirmer la commande', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class _CartItemCard extends ConsumerWidget {
  final dynamic item;
  const _CartItemCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = item.product;
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade100)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
            child: product.image != null
                ? Image.network(product.image!, width: 100, height: 100, fit: BoxFit.cover)
                : Container(width: 100, height: 100, color: Colors.grey.shade50, child: const Icon(Iconsax.image)),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('Quantité: ${item.quantity}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                Text('${(item.totalPrice ?? 0).toStringAsFixed(0)} F', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Iconsax.trash, color: Colors.redAccent, size: 20),
            onPressed: () => _confirmDelete(context, ref, item.id),
          ),
          const Gap(8),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, int? id) {
    if (id == null) return;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Supprimer ?'),
        content: const Text('Voulez-vous retirer cet article du panier ?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Non')),
          TextButton(onPressed: () {
            ref.read(cartItemNotifierProvider.notifier).deleteCartItem(id);
            Navigator.pop(ctx);
          }, child: const Text('Oui, supprimer', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}
