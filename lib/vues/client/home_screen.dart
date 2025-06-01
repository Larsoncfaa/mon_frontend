// lib/features/client/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maliag/vues/client/product_detail_screen.dart';
import '../../fournisseurs/provider/category_provider.dart';
import '../../fournisseurs/provider/product_provider.dart';
import '../../models/product.dart';
import '../../models/category.dart';


class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final selectedCategory = useState<Category?>(null);

    final productState = ref.watch(productNotifierProvider);
    final categoryState = ref.watch(categoryNotifierProvider);

    useEffect(() {
      ref.read(productNotifierProvider.notifier).fetchProducts(); // Initial fetch
      ref.read(categoryNotifierProvider.notifier).fetchCategories();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Zone de recherche
            TextField(
              controller: searchController,
              onChanged: (value) {
                ref.read(productNotifierProvider.notifier).search(value);
              },
              decoration: const InputDecoration(
                hintText: 'Rechercher un produit',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            // Filtres de catégories
            categoryState.when(
              data: (categories) {
                return DropdownButton<Category>(
                  hint: const Text('Filtrer par catégorie'),
                  value: selectedCategory.value,
                  isExpanded: true,
                  onChanged: (Category? value) {
                    selectedCategory.value = value;
                    ref
                        .read(productNotifierProvider.notifier)
                        .filterByCategory(value?.name);
                  },
                  items: categories
                      .map((c) => DropdownMenuItem(
                    value: c,
                    child: Text(c.name),
                  ))
                      .toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (err, _) => Text('Erreur catégories: $err'),
            ),
            const SizedBox(height: 12),
            // Grille des produits
            Expanded(
              child: productState.when(
                data: (paginated) {
                  final products = paginated.results;
                  if (products.isEmpty) {
                    return const Center(child: Text('Aucun produit trouvé.'));
                  }

                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(product: product);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(child: Text('Erreur produits: $err')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image produit
            if (product.image != null)
              Expanded(
                child: Image.network(
                  product.image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Expanded(
                child: Center(child: Icon(Icons.image_not_supported)),
              ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${product.sellingPrice.toStringAsFixed(2)} €',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
