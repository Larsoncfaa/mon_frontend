import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product.dart';
import '../../fournisseurs/provider/product_provider.dart';
import 'forme/product_form.dart';
 // Assure-toi que le chemin est correct

/// Écran de gestion des produits pour l’agriculteur.
class ProductManagementScreen extends ConsumerStatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  ConsumerState<ProductManagementScreen> createState() => _ProductManagementScreenState();
}

class _ProductManagementScreenState extends ConsumerState<ProductManagementScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(productNotifierProvider.notifier);
    final state = ref.read(productNotifierProvider);

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        state is AsyncData &&
        state.value?.next != null &&
        !notifier.isFetchingMore) {
      notifier.fetchNextPage();
    }
  }

  /// Affiche un formulaire pour créer ou éditer un produit.
  void _showProductForm(BuildContext context, {Product? product}) {
    showDialog(
      context: context,
      builder: (_) => ProductForm(
        product: product,
        onSubmit: (newProduct) async {
          if (product == null) {
            await ref.read(productNotifierProvider.notifier).addProduct(newProduct);
          } else {
            await ref.read(productNotifierProvider.notifier).updateProduct(product.id, newProduct);
          }
          ref.invalidate(productNotifierProvider);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncPage = ref.watch(productNotifierProvider);
    final notifier = ref.read(productNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Gestion des produits')),
      body: asyncPage.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erreur : $err')),
        data: (page) => RefreshIndicator(
          onRefresh: () => notifier.refresh(),
          child: ListView.separated(
            controller: _scrollController,
            itemCount: page.results.length + 1,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              if (index == page.results.length) {
                return notifier.isFetchingMore
                    ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                )
                    : const SizedBox.shrink();
              }

              final product = page.results[index];
              return Dismissible(
                key: ValueKey(product.id),
                background: const ColoredBox(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ),
                onDismissed: (_) async {
                  await notifier.deleteProduct(product.id);
                  ref.invalidate(productNotifierProvider);
                },
                child: ListTile(
                  leading: product.image != null
                      ? CircleAvatar(backgroundImage: NetworkImage(product.image!))
                      : const CircleAvatar(child: Icon(Icons.image_not_supported)),
                  title: Text(product.name),
                  subtitle: Text(
                    'Prix : ${product.sellingPrice.toStringAsFixed(2)} | '
                        'Stock : ${product.quantityInStock ?? 0} ${product.unit.name.toUpperCase()}',
                  ),
                  onTap: () => _showProductForm(context, product: product),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProductForm(context),
        tooltip: 'Ajouter un produit',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
