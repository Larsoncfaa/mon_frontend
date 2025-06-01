import 'package:dio/dio.dart';
import '../models/cart.dart';
import '../pagination/paginated_cart_list.dart';

/// Service gérant les requêtes API liées au panier
class CartService {
  final Dio dio;

  CartService(this.dio);

  /// Liste paginée des paniers
  Future<PaginatedCartList> fetchCarts({int page = 1}) async {
    final response = await dio.get('/v1/carts/', queryParameters: {'page': page});
    return PaginatedCartList.fromJson(response.data);
  }

  /// Détails d’un panier
  Future<Cart> getCart(int id) async {
    final response = await dio.get('/v1/carts/$id/');
    return Cart.fromJson(response.data);
  }

  /// Création d’un nouveau panier
  Future<Cart> createCart(Cart cart) async {
    final data = cart.toJson()..remove('id');
    final response = await dio.post('/v1/carts/', data: data);
    return Cart.fromJson(response.data);
  }

  /// Mise à jour d’un panier
  Future<Cart> updateCart(Cart cart) async {
    final response = await dio.put('/v1/carts/${cart.id}/', data: cart.toJson());
    return Cart.fromJson(response.data);
  }

  /// Suppression d’un panier
  Future<void> deleteCart(int id) async {
    await dio.delete('/v1/carts/$id/');
  }
}
