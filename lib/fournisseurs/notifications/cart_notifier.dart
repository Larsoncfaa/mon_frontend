import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/cart.dart';
import '../../pagination/paginated_cart_list.dart';
import '../repositories/cart_repository.dart';


/// Notifier pour gérer l'état des paniers
class CartNotifier extends StateNotifier<AsyncValue<PaginatedCartList>> {
  final CartRepository repository;

  CartNotifier(this.repository) : super(const AsyncLoading()) {
    fetchCarts();
  }

  Future<void> fetchCarts({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchCarts(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteCart(int id) async {
    try {
      await repository.deleteCart(id);
      await fetchCarts();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
