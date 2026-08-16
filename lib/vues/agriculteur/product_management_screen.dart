import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:maliag/vues/agriculteur/selection_list_page.dart';

import '../../../models/product.dart';
import '../../fournisseurs/provider/product_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/error_widget.dart';
import 'forme/product_discount_screen.dart';
import 'forme/product_form.dart';

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
    final notifier = ref.read(productProvider.notifier);
    final state = ref.read(productProvider);
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && state is AsyncData && state.value?.next != null && !notifier.isFetchingMore) {
      notifier.fetchNextPage();
    }
  }

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
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncPage = ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Catalogue Produits', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Iconsax.task_square, color: Colors.blue), tooltip: 'Sélections', onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SelectionListPage()))),
          IconButton(icon: const Icon(Iconsax.percentage_square, color: Colors.orange), tooltip: 'Remises', onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProductDiscountScreen()))),
          const Gap(8),
        ],
      ),
      drawer: const AppDrawer(),
      body: asyncPage.when(
        loading: () => const LoadingWidget(),
        error: (err, _) => ErrorDisplayWidget(error: err.toString()),
        data: (page) => RefreshIndicator(
          onRefresh: () => notifier.refresh(),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(20),
            itemCount: page.results.length + 1,
            separatorBuilder: (_, __) => const Gap(16),
            itemBuilder: (context, index) {
              if (index == page.results.length) {
                return notifier.isFetchingMore ? const Center(child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator())) : const SizedBox.shrink();
              }
              return _ProductListTile(product: page.results[index], onEdit: () => _showProductForm(context, product: page.results[index]), onDelete: () => _confirmDelete(context, page.results[index].id));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showProductForm(context),
        backgroundColor: Colors.green,
        icon: const Icon(Iconsax.add, color: Colors.white),
        label: const Text('Ajouter Produit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Supprimer ?'),
        content: const Text('Ce produit sera retiré du catalogue.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white), child: const Text('Supprimer')),
        ],
      ),
    );
    if (confirm == true) {
      await ref.read(productProvider.notifier).deleteProduct(id);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Produit supprimé')));
    }
  }
}

class _ProductListTile extends StatelessWidget {
  final Product product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const _ProductListTile({required this.product, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))]),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: product.image != null
              ? Image.network(product.image!, width: 60, height: 60, fit: BoxFit.cover, errorBuilder: (_, __, ___) => _imgPlaceholder())
              : _imgPlaceholder(),
        ),
        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${product.sellingPrice?.toStringAsFixed(0) ?? "0"} F • Stock: ${product.quantityInStock ?? 0} ${product.unit.label.toUpperCase()}', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Iconsax.edit_2, size: 20, color: Colors.blue), onPressed: onEdit),
            IconButton(icon: const Icon(Iconsax.trash, size: 20, color: Colors.redAccent), onPressed: onDelete),
          ],
        ),
      ),
    );
  }

  Widget _imgPlaceholder() => Container(width: 60, height: 60, color: Colors.grey.shade100, child: const Icon(Iconsax.image, color: Colors.grey));
}
