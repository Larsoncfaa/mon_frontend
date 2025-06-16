import 'package:flutter/foundation.dart';

import '../../models/cart_item.dart';
import '../../pagination/paginated_cart_item_list.dart';
import '../../services/cart_item_service.dart';

/// Repository pour gérer les opérations sur les éléments du panier
/// en encapsulant la logique métier au-dessus du service Dio.
class CartItemRepository {
  final CartItemService service;

  CartItemRepository(this.service);

  /// Récupère les éléments du panier (paginés)
  Future<PaginatedCartItemList> fetchCartItems({int page = 1}) async {
    try {
      debugPrint('[CartItemRepository] Fetching cart items (page $page)...');
      return await service.fetchCartItems(page: page);
    } catch (e, st) {
      debugPrint('[CartItemRepository][ERROR] fetchCartItems: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Récupère un élément du panier par son ID
  Future<CartItem> getCartItem(int id) async {
    try {
      debugPrint('[CartItemRepository] Getting cart item with id=$id...');
      return await service.getCartItem(id);
    } catch (e, st) {
      debugPrint('[CartItemRepository][ERROR] getCartItem: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Met à jour un élément du panier
  Future<CartItem> updateCartItem(CartItem item) async {
    try {
      debugPrint('[CartItemRepository] Updating cart item id=${item.id}...');
      return await service.updateCartItem(item);
    } catch (e, st) {
      debugPrint('[CartItemRepository][ERROR] updateCartItem: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Supprime un élément du panier
  Future<void> deleteCartItem(int id) async {
    try {
      debugPrint('[CartItemRepository] Deleting cart item id=$id...');
      await service.deleteCartItem(id);
    } catch (e, st) {
      debugPrint('[CartItemRepository][ERROR] deleteCartItem: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Ajoute un produit au panier
  Future<CartItem> addCartItem({
    required int productId,
    required int quantity,
  }) async {
    try {
      debugPrint('[CartItemRepository] Adding product (id=$productId, quantity=$quantity) to cart...');
      return await service.addCartItem(productId: productId, quantity: quantity);
    } catch (e, st) {
      debugPrint('[CartItemRepository][ERROR] addCartItem: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }
}
