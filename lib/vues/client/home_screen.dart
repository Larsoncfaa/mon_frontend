import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'product_detail_screen.dart';

import '../../fournisseurs/provider/category_provider.dart';
import '../../fournisseurs/provider/product_discount_provider.dart';
import '../../fournisseurs/provider/selection_provider.dart';
import '../../widgets/client_drawer_widget.dart';
import '../../widgets/product_card.dart';
import '../../models/product.dart';
import '../../models/category.dart';
import '../../models/product_discount.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    useListenable(searchController);
    final selectedCategory = useState<Category?>(null);

    final selectionState = ref.watch(selectionNotifierProvider);
    final discountState = ref.watch(productDiscountNotifierProvider);
    final categoryState = ref.watch(categoryNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(categoryNotifierProvider.notifier).fetchCategories();
      });
      return null;
    }, []);

    final isLoading = selectionState.isLoading || categoryState.isLoading;

    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final discountMap = discountState.maybeWhen(
      data: (data) => {for (var d in data.results) d.product: d},
      orElse: () => <int, ProductDiscount>{},
    );

    // Convert selections to Product objects
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

    List<Product> allProducts = [...selectionProducts];

    // Filter by category
    if (selectedCategory.value != null) {
      allProducts = allProducts.where((p) => p.category == selectedCategory.value!.name).toList();
    }

    // Filter by search
    final searchQuery = searchController.text.trim().toLowerCase();
    if (searchQuery.isNotEmpty) {
      allProducts = allProducts.where((p) => p.name.toLowerCase().contains(searchQuery)).toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const ClientDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bienvenue 👋', style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
            const Text('Marché MaliAg', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Badge(label: Text('2'), child: Icon(Iconsax.shopping_cart, color: Colors.black)),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          const Gap(8),
        ],
      ),
      body: Column(
        children: [
          _buildSearchAndFilter(context, searchController, categoryState, selectedCategory),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.wait([
                  ref.read(selectionNotifierProvider.notifier).loadSelections(),
                  ref.read(categoryNotifierProvider.notifier).loadCategories(),
                ]);
              },
              child: allProducts.isEmpty
                  ? _buildEmptyState()
                  : GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.72,
                      ),
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        final product = allProducts[index];
                        return ProductCard(product: product, discount: discountMap[product.id]);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context, TextEditingController controller, AsyncValue<List<Category>> categoryState, ValueNotifier<Category?> selectedCategory) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Rechercher un produit...',
              prefixIcon: const Icon(Iconsax.search_normal_1, size: 20),
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            ),
          ),
          const Gap(20),
          SizedBox(
            height: 40,
            child: categoryState.when(
              data: (categories) => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                separatorBuilder: (_, __) => const Gap(10),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _FilterChip(
                      label: 'Tous',
                      isSelected: selectedCategory.value == null,
                      onTap: () => selectedCategory.value = null,
                    );
                  }
                  final cat = categories[index - 1];
                  return _FilterChip(
                    label: cat.name,
                    isSelected: selectedCategory.value?.id == cat.id,
                    onTap: () => selectedCategory.value = cat,
                  );
                },
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.search_status, size: 64, color: Colors.grey.shade300),
          const Gap(16),
          Text('Aucun produit trouvé', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
          Text('Essayez une autre recherche ou catégorie', style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.green : Colors.grey.shade200),
        ),
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}
