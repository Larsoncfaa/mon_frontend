import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/cart_item.dart';
import '../../pagination/paginated_cart_item_list.dart';
import '../../services/cart_item_service.dart';
import '../repositories/cart_item_repository.dart';

/// 1. Service Provider
final cartItemServiceProvider = Provider<CartItemService>((ref) {
  final dio = ref.watch(dioProvider);
  return CartItemService(dio);
});

/// 2. Repository Provider
final cartItemRepositoryProvider = Provider<CartItemRepository>((ref) {
  final service = ref.watch(cartItemServiceProvider);
  return CartItemRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class CartItemNotifier extends Notifier<AsyncValue<PaginatedCartItemList>> {
  @override
  AsyncValue<PaginatedCartItemList> build() {
    Future.microtask(() => fetchCartItems());
    return const AsyncValue.loading();
  }

  /// Récupère les éléments du panier (avec pagination).
  Future<void> fetchCartItems({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(cartItemRepositoryProvider);
      final result = await repository.fetchCartItems(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      debugPrint('[CartItemNotifier][ERROR] fetchCartItems ❌: $e');
      state = AsyncError(e, st);
    }
  }

  /// Supprime un élément du panier par ID, puis recharge la liste.
  Future<void> deleteCartItem(int id) async {
    try {
      final repository = ref.read(cartItemRepositoryProvider);
      await repository.deleteCartItem(id);
      await fetchCartItems();
    } catch (e, st) {
      debugPrint('[CartItemNotifier][ERROR] deleteCartItem ❌: $e');
      state = AsyncError(e, st);
    }
  }

  /// Ajoute un produit au panier et met à jour la liste locale si possible.
  Future<void> addCartItem({
    required int productId,
    required int quantity,
  }) async {
    try {
      final repository = ref.read(cartItemRepositoryProvider);
      final newItem = await repository.addCartItem(
        productId: productId,
        quantity: quantity,
      );

      final currentData = state.value;
      if (currentData != null) {
        final updatedResults = [...currentData.results, newItem];
        final updated = currentData.copyWith(
          count: updatedResults.length,
          results: updatedResults,
        );
        state = AsyncData(updated);
      } else {
        await fetchCartItems();
      }
    } catch (e, st) {
      debugPrint('[CartItemNotifier][ERROR] addCartItem ❌: $e');
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final cartItemNotifierProvider =
NotifierProvider<CartItemNotifier, AsyncValue<PaginatedCartItemList>>(
  CartItemNotifier.new,
);

/// 4. Fournisseur permettant de récupérer un élément du panier par son ID.
final cartItemByIdProvider = FutureProvider.family<CartItem, int>((ref, id) async {
  final repo = ref.watch(cartItemRepositoryProvider);
  return repo.getCartItem(id);
});
