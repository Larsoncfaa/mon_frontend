import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/product_discount.dart';
import '../../pagination/paginated_product_discount_list.dart';
import '../../services/product_discount_service.dart';
import '../repositories/product_discount_repository.dart';

/// 1. Service Provider
final productDiscountServiceProvider = Provider<ProductDiscountService>((ref) {
  return ProductDiscountService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final productDiscountRepositoryProvider = Provider<ProductDiscountRepository>((ref) {
  return ProductDiscountRepository(ref.watch(productDiscountServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class ProductDiscountNotifier
    extends Notifier<AsyncValue<PaginatedProductDiscountList>> {

  @override
  AsyncValue<PaginatedProductDiscountList> build() {
    Future.microtask(() => load());
    return const AsyncLoading();
  }

  Future<void> load({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(productDiscountRepositoryProvider);
      final data = await repository.fetchAll(page: page);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> createDiscount(ProductDiscount newDiscount) async {
    try {
      final repository = ref.read(productDiscountRepositoryProvider);
      await repository.create(newDiscount);
      await load(page: 1);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateDiscount(int id, ProductDiscount updatedDiscount) async {
    try {
      final repository = ref.read(productDiscountRepositoryProvider);
      await repository.update(id, updatedDiscount);
      await load(page: 1);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteDiscount(int id) async {
    try {
      final repository = ref.read(productDiscountRepositoryProvider);
      await repository.delete(id);
      await load(page: 1);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final productDiscountNotifierProvider = NotifierProvider<
    ProductDiscountNotifier, AsyncValue<PaginatedProductDiscountList>>(
  ProductDiscountNotifier.new,
);
