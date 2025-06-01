import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/product.dart';
import '../../../fournisseurs/provider/product_provider.dart';

class ProductManagementScreen extends ConsumerStatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  ConsumerState<ProductManagementScreen> createState() => _ProductManagementScreenState();
}

class _ProductManagementScreenState extends ConsumerState<ProductManagementScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(productNotifierProvider.notifier);
    final state = ref.read(productNotifierProvider);

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        state is AsyncData &&
        state.value?.next != null) {
      // Implémentation future pour le scroll infini si besoin
    }
  }

  void _showProductForm(BuildContext context, {Product? product}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product == null ? 'Ajouter un produit' : 'Modifier le produit'),
        content: const Text('Formulaire à implémenter ici.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Fermer")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des produits"),
      ),
      body: productsAsync.when(
        data: (paginated) => RefreshIndicator(
          onRefresh: () async => ref.read(productNotifierProvider.notifier).refresh(),
          child: ListView.separated(
            controller: _scrollController,
            itemCount: paginated.results.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final product = paginated.results[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: product.image != null ? NetworkImage(product.image!) : null,
                  child: product.image == null ? const Icon(Icons.image_not_supported) : null,
                ),
                title: Text(product.name),
                subtitle: Text('Prix : ${product.sellingPrice.toStringAsFixed(2)} | Stock : ${product.quantityInStock ?? 0} ${product.unit.name}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showProductForm(context, product: product),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Confirmation"),
                            content: const Text("Supprimer ce produit ?"),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Non")),
                              ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text("Oui")),
                            ],
                          ),
                        );
                        if (confirmed == true) {
                          await ref.read(productNotifierProvider.notifier).repository.deleteProduct(product.id);
                          ref.invalidate(productNotifierProvider);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProductForm(context),
        child: const Icon(Icons.add),
        tooltip: "Ajouter un produit",
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
