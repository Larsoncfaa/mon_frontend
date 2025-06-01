import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_cart_item_list.dart';
import '../repositories/cart_item_repository.dart';

class CartItemNotifier extends StateNotifier<AsyncValue<PaginatedCartItemList>> {
  final CartItemRepository repository;

  CartItemNotifier(this.repository) : super(const AsyncLoading()) {
    fetchCartItems();
  }

  /// Récupère les éléments du panier
  Future<void> fetchCartItems({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchCartItems(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Supprime un élément du panier
  Future<void> deleteCartItem(int id) async {
    try {
      await repository.deleteCartItem(id);
      await fetchCartItems();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Ajoute un élément au panier et met à jour l'état
  Future<void> addCartItem({
    required int cartId,
    required int productId,
    required int quantity,
  }) async {
    try {
      final newItem = await repository.addCartItem(
        cartId: cartId,
        productId: productId,
        quantity: quantity,
      );

      final currentState = state;
      final currentItems = currentState is AsyncData<PaginatedCartItemList>
          ? currentState.value.results
          : [];

      final updatedList = PaginatedCartItemList(
        count: currentItems.length + 1,
        next: null,
        previous: null,
        results: [...currentItems, newItem],
      );

      state = AsyncData(updatedList);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
