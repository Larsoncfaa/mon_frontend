import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_product_discount_list.dart';
import '../repositories/product_discount_repository.dart';

class ProductDiscountNotifier extends StateNotifier<AsyncValue<PaginatedProductDiscountList>> {
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
}
