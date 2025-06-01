import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/models/product.dart';
import '../../pagination/paginated_product_list.dart';
import '../repositories/product_repository.dart';

class ProductNotifier extends StateNotifier<AsyncValue<PaginatedProductList>> {
  final ProductRepository repository;
  bool _isFetchingMore = false;

  ProductNotifier(this.repository) : super(const AsyncLoading()) {
    fetchProducts(); // Charger la première page
  }

  bool get isFetchingMore => _isFetchingMore;

  Future<void> fetchProducts({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchProducts(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> fetchNextPage() async {
    if (state.value?.next == null || _isFetchingMore) return;

    _isFetchingMore = true;
    try {
      final nextPage = await repository.fetchNextUrl(state.value!.next!);
      final current = state.value!;
      final merged = current.copyWith(
        results: [...current.results, ...nextPage.results],
        next: nextPage.next,
      );
      state = AsyncData(merged);
// Optionnel : utile si besoin de savoir la page actuelle
    } catch (e, st) {
      state = AsyncError(e, st);
    } finally {
      _isFetchingMore = false;
    }
  }

  Future<void> refresh() async {
    await fetchProducts(page: 1); // ou _currentPage si tu veux recharger la page actuelle
  }

  Future<void> deleteProduct(int id) async {
    try {
      await repository.deleteProduct(id);
      // Supprime localement pour éviter de tout recharger
      final current = state.value!;
      final updatedList = current.results.where((p) => p.id != id).toList();
      state = AsyncData(current.copyWith(results: updatedList));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addProduct(Product newProduct) async {
    try {
      final created = await repository.createProduct(newProduct);
      final current = state.value;
      if (current != null) {
        final updatedList = [created, ...current.results];
        final updated = current.copyWith(results: updatedList);
        state = AsyncData(updated);
      } else {
        await fetchProducts();
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
  Future<void> updateProduct(int id, Product updatedProduct) async {
    try {
      final result = await repository.updateProduct(id as Product, updatedProduct);
      final current = state.value;
      if (current != null) {
        final updatedList = current.results.map((p) {
          return p.id == id ? result : p;
        }).toList();
        final updated = current.copyWith(results: updatedList);
        state = AsyncData(updated);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
  Future<void> filterByCategory(String? category) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchProductsFilteredByCategory(category);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      return fetchProducts(); // recharge la liste si champ vide
    }

    state = const AsyncLoading();
    try {
      final result = await repository.searchProducts(query);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
