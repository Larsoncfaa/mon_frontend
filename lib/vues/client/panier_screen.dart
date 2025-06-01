// 📁 lib/screens/panier_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/cart_item_provider.dart';
import '../../fournisseurs/provider/order_provider.dart';
import '../../fournisseurs/provider/payment_log_provider.dart';





class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static const List<Widget> _screens = [
    CartScreen(),
    OrdersScreen(),
    PaymentsScreen(),
  ];

  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Panier'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Commandes'),
    BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Paiements'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: _navItems,
      ),
    );
  }
}

// 📁 lib/screens/cart_screen.dart


class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsState = ref.watch(cartItemNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mon Panier')),
      body: cartItemsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (data) {
          final items = data.results;
          final total = items.fold<double>(0, (sum, item) => sum + (item.totalPrice));
          if (items.isEmpty) {
            return const Center(child: Text('Votre panier est vide.'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final productMap = item.product;
                    final name = productMap['name']?.toString() ?? 'Produit';
                    final imageUrl = productMap['image']?.toString();
                    final quantity = item.quantity ?? 1;
                    final price = item.totalPrice;
                    return ListTile(
                      leading: imageUrl != null
                          ? Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                          : const Icon(Icons.image_not_supported),
                      title: Text(name),
                      subtitle: Text('Quantité : $quantity'),
                      trailing: Text('${price.toStringAsFixed(2)} €'),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Total : ${total.toStringAsFixed(2)} €', style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: passer commande
                      },
                      child: const Text('Passer commande'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// 📁 lib/screens/orders_screen.dart


class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(orderNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes Commandes')),
      body: ordersState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (data) {
          final list = data.results;
          if (list!.isEmpty) {
            return const Center(child: Text('Aucune commande trouvée.'));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final order = list[index];
              return ListTile(
                title: Text('Commande #${order.id}'),
                subtitle: Text('Statut : ${order.orderStatus?.name ?? 'Inconnu'}'),
                trailing: Text('${order.total.toStringAsFixed(2)} €'),
              );
            },
          );
        },
      ),
    );
  }
}

// 📁 lib/screens/payments_screen.dart


class PaymentsScreen extends ConsumerWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentsState = ref.watch(paymentLogNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Paiements')),
      body: paymentsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (data) {
          final list = data.results;
          if (list.isEmpty) {
            return const Center(child: Text('Aucun paiement trouvé.'));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final log = list[index];
              return ListTile(
                title: Text('Commande #${log.order}'),
                subtitle: Text('Statut : ${log.paymentStatus}'),
                trailing: Text('${log.amount.toStringAsFixed(2)} €'),
              );
            },
          );
        },
      ),
    );
  }
}
