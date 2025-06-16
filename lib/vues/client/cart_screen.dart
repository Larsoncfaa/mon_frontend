import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/cart_item_provider.dart';
import '../../fournisseurs/provider/order_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool _isSubmitting = false;

  /// Soumettre la commande à partir du panier
  Future<void> _submitOrder() async {
    setState(() => _isSubmitting = true);

    try {
      final order = await ref.read(orderNotifierProvider.notifier).createOrderFromCart();
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Commande créée avec succès')),
      );

      Navigator.pushNamed(
        context,
        '/order-confirmation',
        arguments: order,
      );

      ref.read(cartItemNotifierProvider.notifier).fetchCartItems();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Erreur: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItemsState = ref.watch(cartItemNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mon Panier')),
      body: cartItemsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Erreur: $err')),
        data: (data) {
          final items = data.results;

          if (items.isEmpty) {
            return const Center(child: Text('Votre panier est vide.'));
          }

          // Sécurité pour éviter les null sur totalPrice
          final total = items.fold<double>(
            0,
                (sum, item) => sum + (item.totalPrice ?? 0.0),
          );

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    final item = items[i];
                    final product = item.product;
                    final quantity = item.quantity ?? 0;
                    final totalItem = item.totalPrice ?? 0.0;

                    return ListTile(
                      title: Text(product['name'] ?? 'Produit'),
                      subtitle: Text(
                        'Quantité: $quantity - Total: ${totalItem.toStringAsFixed(2)} FCFA',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          final id = item.id;
                          if (id != null) {
                            ref.read(cartItemNotifierProvider.notifier).deleteCartItem(id);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text('Total'),
                trailing: Text('${total.toStringAsFixed(2)} FCFA'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  icon: _isSubmitting
                      ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Icon(Icons.check),
                  label: Text(_isSubmitting ? 'Commande en cours...' : 'Passer la commande'),
                  onPressed: _isSubmitting ? null : _submitOrder,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
