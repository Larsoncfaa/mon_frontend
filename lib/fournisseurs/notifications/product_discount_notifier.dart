import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/product_discount.dart';
import '../../pagination/paginated_product_discount_list.dart';
import '../repositories/product_discount_repository.dart';

// Provider du repository (à adapter selon ton projet)
final productDiscountRepositoryProvider = Provider<ProductDiscountRepository>((ref) {
  throw UnimplementedError('Initialisez votre ProductDiscountRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class ProductDiscountNotifier
    extends Notifier<AsyncValue<PaginatedProductDiscountList>> {
  late final ProductDiscountRepository _repository;

  @override
  AsyncValue<PaginatedProductDiscountList> build() {
    _repository = ref.watch(productDiscountRepositoryProvider);
    load();
    return const AsyncLoading();
  }

  Future<void> load({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final data = await _repository.fetchAll(page: page);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> createDiscount(ProductDiscount newDiscount) async {
    final previous = state;
    try {
      state = const AsyncLoading();
      await _repository.create(newDiscount);
      await load(page: 1);
    } catch (e, st) {
      state = previous;
      state = AsyncError(e, st);
    }
  }

  Future<void> updateDiscount(int id, ProductDiscount updatedDiscount) async {
    final previous = state;
    try {
      state = const AsyncLoading();
      await _repository.update(id, updatedDiscount);
      await load(page: 1);
    } catch (e, st) {
      state = previous;
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteDiscount(int id) async {
    final previous = state;
    try {
      state = const AsyncLoading();
      await _repository.delete(id);
      await load(page: 1);
    } catch (e, st) {
      state = previous;
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final productDiscountNotifierProvider = NotifierProvider<
    ProductDiscountNotifier, AsyncValue<PaginatedProductDiscountList>>(
  ProductDiscountNotifier.new,
);