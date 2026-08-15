import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/product.dart';
import '../../pagination/paginated_product_list.dart';
import '../../services/product_service.dart';
import '../repositories/product_repository.dart';

/// 1. Service Provider
final productServiceProvider = Provider<ProductService>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductService(dio);
});

/// 2. Repository Provider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final productService = ref.watch(productServiceProvider);
  return ProductRepository(productService);
});

/// Notifier moderne pour Riverpod 3.x
class ProductNotifier extends Notifier<AsyncValue<PaginatedProductList>> {
  bool _isFetchingMore = false;
  final List<Product> _allProducts = [];

  bool get isFetchingMore => _isFetchingMore;

  @override
  AsyncValue<PaginatedProductList> build() {
    // Lancement du chargement initial
    Future.microtask(() => fetchProducts());
    return const AsyncLoading();
  }

  /// Charge la première page ou une page spécifique
  Future<void> fetchProducts({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(productRepositoryProvider);
      final result = await repository.fetchProducts(page: page);
      _allProducts.clear();
      _allProducts.addAll(result.results);
      state = AsyncValue.data(result);
    } catch (e, st) {
      debugPrint('[ProductNotifier] Error: $e');
      state = AsyncValue.error(e, st);
    }
  }

  /// Scroll infini : charge la page suivante
  Future<void> fetchNextPage() async {
    final current = state.value;
    if (current == null || current.next == null || _isFetchingMore) return;

    _isFetchingMore = true;
    try {
      final repository = ref.read(productRepositoryProvider);
      final uri = Uri.parse(current.next!);
      final nextPage = int.tryParse(uri.queryParameters['page'] ?? '1') ?? 1;
      final nextPageResult = await repository.fetchProducts(page: nextPage);

      final newResults = nextPageResult.results.where(
            (product) => !_allProducts.any((p) => p.id == product.id),
      );

      _allProducts.addAll(newResults);

      final merged = current.copyWith(
        results: [...current.results, ...newResults],
        next: nextPageResult.next,
      );

      state = AsyncValue.data(merged);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isFetchingMore = false;
    }
  }

  /// Recharge depuis la première page
  Future<void> refresh() async {
    await fetchProducts(page: 1);
  }

  /// Recherche locale par nom
  void search(String query) {
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

    state = AsyncValue.data(
      PaginatedProductList(
        count: results.length,
        next: null,
        previous: null,
        results: results,
      ),
    );
  }

  /// Ajout d’un produit
  Future<void> addProduct(Product product, {File? imageFile}) async {
    try {
      final repository = ref.read(productRepositoryProvider);
      await repository.createProduct(product, imageFile: imageFile);
      await fetchProducts(page: 1);
    } catch (e) {
      debugPrint('[ProductNotifier] Error addProduct: $e');
    }
  }

  /// Mise à jour d’un produit
  Future<void> updateProduct(Product product, {File? imageFile}) async {
    try {
      final repository = ref.read(productRepositoryProvider);
      await repository.updateProduct(product, imageFile: imageFile);
      await fetchProducts(page: 1);
    } catch (e) {
      debugPrint('[ProductNotifier] Error updateProduct: $e');
    }
  }

  /// Suppression d’un produit
  Future<void> deleteProduct(int id) async {
    try {
      final repository = ref.read(productRepositoryProvider);
      await repository.deleteProduct(id);
      await fetchProducts(page: 1);
    } catch (e) {
      debugPrint('[ProductNotifier] Error deleteProduct: $e');
    }
  }

  Future<bool> checkProductExists(String name, String category, {int? excludeId}) async {
    try {
      final repository = ref.read(productRepositoryProvider);
      return await repository.checkProductExists(name, category, excludeId: excludeId);
    } catch (e) {
      debugPrint('[ProductNotifier] checkProductExists error: $e');
      return false;
    }
  }
}

/// 3. Notifier Provider principal
final productNotifierProvider = NotifierProvider<ProductNotifier,
    AsyncValue<PaginatedProductList>>(
  ProductNotifier.new,
);

final productProvider = productNotifierProvider;
