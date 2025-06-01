import 'package:dio/dio.dart';

import '../models/cart_item.dart';
import '../pagination/paginated_cart_item_list.dart';

class CartItemService {
  final Dio dio;

  CartItemService(this.dio);

  Future<PaginatedCartItemList> fetchCartItems({int page = 1}) async {
    final response = await dio.get('/v1/cart-items/?page=$page');
    return PaginatedCartItemList.fromJson(response.data);
  }

  Future<CartItem> getCartItem(int id) async {
    final response = await dio.get('/v1/cart-items/$id/');
    return CartItem.fromJson(response.data);
  }

  Future<CartItem> createCartItem(CartItem item) async {
    final response = await dio.post('/v1/cart-items/', data: item.toJson());
    return CartItem.fromJson(response.data);
  }

  Future<CartItem> updateCartItem(CartItem item) async {
    final response = await dio.put('/v1/cart-items/${item.id}/', data: item.toJson());
    return CartItem.fromJson(response.data);
  }

  Future<void> deleteCartItem(int id) async {
    await dio.delete('/v1/cart-items/$id/');
  }

  Future<CartItem> addCartItem({
    required int cartId,
    required int productId,
    required int quantity,
  }) async {
    final response = await dio.post('/v1/cart-items/', data: {
      "cart": cartId,
      "product": productId,
      "quantity": quantity,
    });
    return CartItem.fromJson(response.data);
  }
}
