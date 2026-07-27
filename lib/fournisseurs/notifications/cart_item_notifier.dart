import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_cart_item_list.dart';
import '../repositories/cart_item_repository.dart';

// Déclaration du provider de repository (à adapter selon ton projet)
final cartItemRepositoryProvider = Provider<CartItemRepository>((ref) {
  throw UnimplementedError('Initialisez votre CartItemRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class CartItemNotifier extends Notifier<AsyncValue<PaginatedCartItemList>> {
  late final CartItemRepository _repository;

  @override
  AsyncValue<PaginatedCartItemList> build() {
    _repository = ref.watch(cartItemRepositoryProvider);
    fetchCartItems();
    return const AsyncValue.loading();
  }

  /// Récupère les éléments du panier (avec pagination).
  Future<void> fetchCartItems({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await _repository.fetchCartItems(page: page);
      debugPrint('[CartItemNotifier] fetchCartItems ✅ ${result.results.length} éléments');
      state = AsyncData(result);
    } catch (e, st) {
      debugPrint('[CartItemNotifier][ERROR] fetchCartItems ❌: $e');
      debugPrintStack(stackTrace: st);
      state = AsyncError(e, st);
    }
  }

  /// Supprime un élément du panier par ID, puis recharge la liste.
  Future<void> deleteCartItem(int id) async {
    try {
      await _repository.deleteCartItem(id);
      debugPrint('[CartItemNotifier] deleteCartItem ✅ ID supprimé: $id');
      await fetchCartItems();
    } catch (e, st) {
      debugPrint('[CartItemNotifier][ERROR] deleteCartItem ❌: $e');
      debugPrintStack(stackTrace: st);
      state = AsyncError(e, st);
    }
  }

  /// Ajoute un produit au panier et met à jour la liste locale si possible.
  Future<void> addCartItem({
    required int productId,
    required int quantity,
  }) async {
    try {
      final newItem = await _repository.addCartItem(
        productId: productId,
        quantity: quantity,
      );
      debugPrint('[CartItemNotifier] addCartItem ✅ Ajouté: $newItem');

      // Accès direct à la valeur de l'état si disponible
      final currentData = state.value;
      if (currentData != null) {
        final updatedResults = [...currentData.results, newItem];
        final updated = currentData.copyWith(
          count: updatedResults.length,
          results: updatedResults,
        );
        state = AsyncData(updated);
      } else {
        await fetchCartItems(); // Fallback si l'état n'était pas chargé
      }
    } catch (e, st) {
      debugPrint('[CartItemNotifier][ERROR] addCartItem ❌: $e');
      debugPrintStack(stackTrace: st);
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final cartItemNotifierProvider =
NotifierProvider<CartItemNotifier, AsyncValue<PaginatedCartItemList>>(
  CartItemNotifier.new,
);