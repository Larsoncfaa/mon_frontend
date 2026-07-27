import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product.dart';
import '../../pagination/paginated_product_list.dart';
import '../repositories/product_repository.dart';

import '../provider/product_provider.dart';

/// Notifier qui gère la liste paginée des produits, avec recherche et filtre (Riverpod 3.x).
class ProductNotifier extends Notifier<AsyncValue<PaginatedProductList>> {
  late final ProductRepository _repository;

  bool _isFetchingMore = false;
  final List<Product> _allProducts = [];

  bool get isFetchingMore => _isFetchingMore;

  @override
  AsyncValue<PaginatedProductList> build() {
    _repository = ref.watch(productRepositoryProvider);
    // Charge la page 1 au démarrage
    fetchProducts(page: 1);
    return const AsyncLoading();
  }

  /// Charge la première page ou une page spécifique
  Future<void> fetchProducts({int page = 1}) async {
    debugPrint('[ProductNotifier] fetchProducts(page: $page)');
    state = const AsyncLoading();
    try {
      final result = await _repository.fetchProducts(page: page);
      _allProducts.clear();
      _allProducts.addAll(result.results);
      debugPrint('[ProductNotifier] Fetched ${result.results.length} products');
      state = AsyncValue.data(result);
      for (final p in result.results) {
        debugPrint('→ Produit reçu du backend: '
            'id=${p.id}, '
            'name=${p.name}, '
            'stock=${p.quantityInStock}, '
            'sellingPrice=${p.sellingPrice}');
      }
    } catch (e, st) {
      debugPrint('[ProductNotifier] Error in fetchProducts: $e');
      state = AsyncValue.error(e, st);
    }
  }

  /// Scroll infini : charge la page suivante
  Future<void> fetchNextPage() async {
    final current = state.value;
    if (current == null || current.next == null || _isFetchingMore) return;

    _isFetchingMore = true;
    debugPrint('[ProductNotifier] fetchNextPage');

    try {
      final uri = Uri.parse(current.next!);
      final nextPage = int.tryParse(uri.queryParameters['page'] ?? '1') ?? 1;
      final nextPageResult = await _repository.fetchProducts(page: nextPage);

      final newResults = nextPageResult.results.where(
            (product) => !_allProducts.any((p) => p.id == product.id),
      );

      _allProducts.addAll(newResults);

      final merged = current.copyWith(
        results: [...current.results, ...newResults],
        next: nextPageResult.next,
      );

      debugPrint('[ProductNotifier] Appended ${newResults.length} products');
      state = AsyncValue.data(merged);
    } catch (e, st) {
      debugPrint('[ProductNotifier] Error in fetchNextPage: $e');
      state = AsyncValue.error(e, st);
    } finally {
      _isFetchingMore = false;
    }
  }

  /// Recharge depuis la première page
  Future<void> refresh() async {
    debugPrint('[ProductNotifier] refresh()');
    await fetchProducts(page: 1);
  }

  /// Recherche locale par nom
  void search(String query) {
    debugPrint('[ProductNotifier] search("$query")');
    final q = query.toLowerCase();
    final results = _allProducts.where((p) => p.name.toLowerCase().contains(q)).toList();

    state = AsyncValue.data(
      PaginatedProductList(
        count: results.length,
        next: null,
        previous: null,
        results: results,
      ),
    );
  }

  /// Filtrage local par nom de catégorie
  void filterByCategory(String? categoryName) {
    debugPrint('[ProductNotifier] filterByCategory("$categoryName")');

    if (categoryName == null || categoryName.trim().isEmpty) {
      state = AsyncValue.data(
        PaginatedProductList(
          count: _allProducts.length,
          next: null,
          previous: null,
          results: _allProducts,
        ),
      );
      return;
    }

    final results = _allProducts
        .where((p) => p.category.toLowerCase() == categoryName.toLowerCase())
        .toList();
    debugPrint('[ProductNotifier] Found ${results.length} products for category "$categoryName"');

    state = AsyncValue.data(
      PaginatedProductList(
        count: results.length,
        next: null,
        previous: null,
        results: results,
      ),
    );
  }

  /// Ajout d’un produit (avec image facultative)
  Future<void> addProduct(Product product, {File? imageFile}) async {
    try {
      await _repository.createProduct(product, imageFile: imageFile);
      debugPrint('[ProductNotifier] addProduct: ${product.name}');
      await fetchProducts(page: 1);
    } catch (e) {
      debugPrint('[ProductNotifier] Error in addProduct: $e');
    }
  }

  /// Mise à jour d’un produit (avec image facultative)
  Future<void> updateProduct(Product product, {File? imageFile}) async {
    try {
      await _repository.updateProduct(product, imageFile: imageFile);
      debugPrint('[ProductNotifier] updateProduct: ${product.id}');
      await fetchProducts(page: 1);
    } catch (e) {
      debugPrint('[ProductNotifier] Error in updateProduct: $e');
    }
  }

  /// Suppression d’un produit
  Future<void> deleteProduct(int id) async {
    try {
      await _repository.deleteProduct(id);
      debugPrint('[ProductNotifier] deleteProduct: $id');
      await fetchProducts(page: 1);
    } catch (e) {
      debugPrint('[ProductNotifier] Error in deleteProduct: $e');
    }
  }

  Future<bool> checkProductExists(String name, String category, {int? excludeId}) async {
    try {
      return await _repository.checkProductExists(name, category, excludeId: excludeId);
    } catch (e) {
      debugPrint('[ProductNotifier] checkProductExists error: $e');
      return false;
    }
  }
}

