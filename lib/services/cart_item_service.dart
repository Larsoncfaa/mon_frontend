import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../pagination/paginated_cart_item_list.dart';

class CartItemService {
  final Dio dio;

  CartItemService(this.dio);

  /// Récupère tous les éléments du panier (avec pagination)
  Future<PaginatedCartItemList> fetchCartItems({int page = 1}) async {
    try {
      debugPrint('[CartItemService] Fetching cart items page $page...');
      final response = await dio.get('/cart/items/?page=$page');
      debugPrint('[CartItemService] Response: ${response.data}');
      return PaginatedCartItemList.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('[CartItemService][ERROR] fetchCartItems: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Récupère un élément du panier par son ID
  Future<CartItem> getCartItem(int id) async {
    try {
      debugPrint('[CartItemService] Getting cart item $id...');
      final response = await dio.get('/cart/items/$id/');
      debugPrint('[CartItemService] Response: ${response.data}');
      return CartItem.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('[CartItemService][ERROR] getCartItem: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Met à jour un élément du panier
  Future<CartItem> updateCartItem(CartItem item) async {
    try {
      debugPrint('[CartItemService] Updating cart item ${item.id}...');
      final response = await dio.put(
        '/cart/items/${item.id}/update/',
        data: item.toJson(),
      );
      debugPrint('[CartItemService] Response: ${response.data}');
      return CartItem.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('[CartItemService][ERROR] updateCartItem: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Supprime un élément du panier
  Future<void> deleteCartItem(int id) async {
    try {
      debugPrint('[CartItemService] Deleting cart item $id...');
      await dio.delete('/cart/items/$id/delete/');
      debugPrint('[CartItemService] Deleted successfully.');
    } catch (e, stackTrace) {
      debugPrint('[CartItemService][ERROR] deleteCartItem: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Ajoute un produit au panier (endpoint POST /cart/items/add/)
  Future<CartItem> addCartItem({
    required int productId,
    required int quantity,
  }) async {
    try {
      final data = {
        "product_id": productId, // ✅ corriger ici
        "quantity": quantity,
      };
      debugPrint('[CartItemService] Adding item to cart: $data');
      final response = await dio.post('/cart/items/add/', data: data);
      debugPrint('[CartItemService] Response: ${response.data}');
      return CartItem.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('[CartItemService][ERROR] addCartItem: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
