import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_cart_item_list.dart';
import '../repositories/cart_item_repository.dart';

/// Notifier pour gérer l’état des éléments du panier.
/// Utilise AsyncValue pour gérer le chargement, les données et les erreurs.
class CartItemNotifier extends StateNotifier<AsyncValue<PaginatedCartItemList>> {
  final CartItemRepository repository;

  CartItemNotifier(this.repository) : super(const AsyncLoading()) {
    fetchCartItems();
  }

  /// Récupère les éléments du panier (avec pagination).
  Future<void> fetchCartItems({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchCartItems(page: page);
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
      await repository.deleteCartItem(id);
      debugPrint('[CartItemNotifier] deleteCartItem ✅ ID supprimé: $id');
      await fetchCartItems(); // on peut aussi le faire de manière optimisée
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
      final newItem = await repository.addCartItem(
        productId: productId,
        quantity: quantity,
      );
      debugPrint('[CartItemNotifier] addCartItem ✅ Ajouté: $newItem');

      final currentState = state;
      if (currentState is AsyncData<PaginatedCartItemList>) {
        final updatedResults = [...currentState.value.results, newItem];
        final updated = currentState.value.copyWith(
          count: updatedResults.length,
          results: updatedResults,
        );
        state = AsyncData(updated);
      } else {
        await fetchCartItems(); // fallback si l’état n’est pas exploitable
      }
    } catch (e, st) {
      debugPrint('[CartItemNotifier][ERROR] addCartItem ❌: $e');
      debugPrintStack(stackTrace: st);
      state = AsyncError(e, st);
    }
  }
}
