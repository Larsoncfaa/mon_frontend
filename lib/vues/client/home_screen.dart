import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maliag/vues/client/product_detail_screen.dart';

import '../../fournisseurs/provider/category_provider.dart';
import '../../fournisseurs/provider/product_discount_provider.dart';
import '../../fournisseurs/provider/selection_provider.dart';
import '../../widgets/product_card.dart';
import '../../models/product.dart';
import '../../models/category.dart';
import '../../models/product_discount.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final selectedCategory = useState<Category?>(null);

    final selectionState = ref.watch(selectionNotifierProvider);
    final discountState = ref.watch(productDiscountNotifierProvider);
    final categoryState = ref.watch(categoryNotifierProvider);

    // Chargement des catégories au montage
    useEffect(() {
      ref.read(categoryNotifierProvider.notifier).fetchCategories();
      return null;
    }, []);

    // Vérification des états de chargement / erreurs
    final isLoading = selectionState.isLoading || discountState.isLoading;
    final hasError = selectionState.error != null || discountState.hasError;

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (hasError) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenue'),
          actions: [
          ],
        ),
        body: Center(
          child: Text(
            selectionState.error ?? 'Erreur lors du chargement des données',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    // Map des remises par produit
    final discountMap = discountState.maybeWhen(
      data: (data) => {
        for (var d in data.results) d.product: d,
      },
      orElse: () => <int, ProductDiscount>{},
    );

    // Produits issus des sélections
    final selectionProducts = selectionState.selections.map((s) {
      return Product(
        id: s.product,
        name: s.name,
        category: s.category,
        image: s.image,
        description: s.description,
        expirationDate: s.expirationDate,
        sellingPrice: double.tryParse(s.sellingPrice),
        unit: UnitEnum.kg,
        purchasePrice: null,
        quantityInStock: null,
        qrCodeImage: null,
      );
    }).toList();

    // Produits promo uniquement
    final discountOnlyProducts = discountMap.keys
        .where((id) => !selectionProducts.any((p) => p.id == id))
        .map((id) => Product(
      id: id,
      name: 'Produit en promo',
      category: 'Promo',
      image: null,
      description: null,
      expirationDate: null,
      sellingPrice: null,
      unit: UnitEnum.kg,
      purchasePrice: null,
      quantityInStock: null,
      qrCodeImage: null,
    ))
        .toList();

    // Fusion des produits
    List<Product> allProducts = [...selectionProducts, ...discountOnlyProducts];

    // Suppression des doublons (par ID)
    final seenIds = <int>{};
    allProducts = allProducts.where((p) => seenIds.add(p.id)).toList();

    // Filtrage par catégorie
    if (selectedCategory.value != null) {
      allProducts = allProducts
          .where((p) => p.category == selectedCategory.value!.name)
          .toList();
    }

    // Filtrage par recherche
    final searchQuery = searchController.text.trim().toLowerCase();
    if (searchQuery.isNotEmpty) {
      allProducts = allProducts
          .where((p) => p.name.toLowerCase().contains(searchQuery))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Voir le panier',
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Voir le profil',
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (_) => ref.refresh(selectionNotifierProvider),
              decoration: const InputDecoration(
                hintText: 'Rechercher un produit',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            categoryState.when(
              data: (categories) {
                return DropdownButton<Category>(
                  hint: const Text('Filtrer par catégorie'),
                  value: selectedCategory.value,
                  isExpanded: true,
                  onChanged: (Category? value) => selectedCategory.value = value,
                  items: categories
                      .map((c) => DropdownMenuItem(
                    value: c,
                    child: Text(c.name),
                  ))
                      .toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (err, _) => Text('Erreur catégories : $err'),
            ),
            const SizedBox(height: 12),
            if (allProducts.isEmpty)
              const Expanded(
                child: Center(child: Text('Aucun produit trouvé.')),
              )
            else
              Expanded(
                child: GridView.builder(
                  itemCount: allProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final product = allProducts[index];
                    final discount = discountMap[product.id];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      child: ProductCard(product: product, discount: discount),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
