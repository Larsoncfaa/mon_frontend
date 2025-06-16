import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/vues/agriculteur/selection_list_page.dart';

import '../../../models/product.dart';
import '../../fournisseurs/provider/product_provider.dart';
import '../../widgets/app_drawer.dart';
import 'forme/product_discount_screen.dart';
import 'forme/product_form.dart';

/// Écran de gestion des produits pour l’agriculteur.
class ProductManagementScreen extends ConsumerStatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  ConsumerState<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState
    extends ConsumerState<ProductManagementScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final notifier = ref.read(productProvider.notifier);
    final state = ref.read(productProvider);

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
        onSubmit: (newProduct, imageFile) async {
          final notifier = ref.read(productProvider.notifier);
          if (product == null) {
            await notifier.addProduct(newProduct, imageFile: imageFile);
          } else {
            await notifier.updateProduct(newProduct, imageFile: imageFile);
          }
          // Plus besoin de ref.invalidate => le notifier recharge déjà la page 1
        },
      ),
    );
  }

  /// Affiche une boîte de dialogue de confirmation avant suppression.
  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: const Text('Voulez-vous vraiment supprimer ce produit ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final asyncPage = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Gestion des produits'),
          actions: [
            IconButton(
              icon: const Icon(Icons.checklist_rtl),
              tooltip: 'Mes sélections',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SelectionListPage(),
                  ),
                );
              },
            ),
          IconButton(
          icon: const Icon(Icons.local_offer), // ou Icons.percent
      tooltip: 'Gérer les remises',
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ProductDiscountScreen(),
          ),
        );
      },
    ),
    ],
      ),
      drawer: const AppDrawer(),
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
                direction: DismissDirection.endToStart,
                background: Container(), // pas besoin ici
                secondaryBackground: const ColoredBox(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ),
                confirmDismiss: (_) async {
                  return await _confirmDelete(context);
                },
                onDismissed: (_) async {
                  await notifier.deleteProduct(product.id);
                  // Plus besoin de ref.invalidate : deleteProduct() recharge déjà la page 1
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Produit supprimé')),
                  );
                },
                child: ListTile(
                  leading: product.image != null
                      ? CircleAvatar(
                      backgroundImage: NetworkImage(product.image!))
                      : const CircleAvatar(
                      child: Icon(Icons.image_not_supported)),
                  title: Text(product.name),
                  subtitle: Text(
                    'Prix vente : ${product.sellingPrice?.toStringAsFixed(2) ?? "N/A"} f\n'
                        'Stock : ${product.quantityInStock ?? 0} ${product.unit.label.toUpperCase()}',
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
