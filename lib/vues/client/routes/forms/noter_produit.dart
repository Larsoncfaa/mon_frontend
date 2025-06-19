import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/provider/order_line_provider.dart'; // à adapter selon ton projet
import '../../../../models/order_line.dart';
import 'ajouter_avis.dart';

class NoterProduitsScreen extends ConsumerWidget {
  final int orderId;

  const NoterProduitsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderLinesAsync = ref.watch(orderLinesByOrderIdProvider(orderId));

    return Scaffold(
      appBar: AppBar(title: const Text('Noter mes produits')),
      body: orderLinesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (paginatedList) {
          final lines = paginatedList.results;
          if (lines.isEmpty) {
            return const Center(child: Text('Aucun produit trouvé pour cette commande.'));
          }
          return ListView.builder(
            itemCount: lines.length,
            itemBuilder: (context, index) {
              final line = lines[index];
              final product = line.product;

              return ListTile(
                title: Text(product.name),
                trailing: IconButton(
                  icon: const Icon(Icons.star),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AjouterAvisScreen(productId: product.id),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
