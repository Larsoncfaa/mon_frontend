import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/product_discount.dart';
import '../../pagination/paginated_product_discount_list.dart';
import '../repositories/product_discount_repository.dart';


class ProductDiscountNotifier
    extends StateNotifier<AsyncValue<PaginatedProductDiscountList>> {
  final ProductDiscountRepository repository;

  ProductDiscountNotifier(this.repository) : super(const AsyncLoading()) {
    load();
  }

  Future<void> load({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final data = await repository.fetchAll(page: page);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> createDiscount(ProductDiscount newDiscount) async {
    final previous = state;
    try {
      state = const AsyncLoading();
      await repository.create(newDiscount);
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
      await repository.update(id, updatedDiscount);
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
      await repository.delete(id);
      await load(page: 1);
    } catch (e, st) {
      state = previous;
      state = AsyncError(e, st);
    }
  }
}
