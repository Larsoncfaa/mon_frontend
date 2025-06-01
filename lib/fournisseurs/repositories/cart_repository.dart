

import '../../models/cart.dart';
import '../../pagination/paginated_cart_list.dart';
import '../../services/cart_service.dart';

/// Repository du panier pour isoler la logique métier/API
class CartRepository {
  final CartService service;

  CartRepository(this.service);

  Future<PaginatedCartList> fetchCarts({int page = 1}) {
    return service.fetchCarts(page: page);
  }

  Future<Cart> getCart(int id) {
    return service.getCart(id);
  }

  Future<Cart> createCart(Cart cart) {
    return service.createCart(cart);
  }

  Future<Cart> updateCart(Cart cart) {
    return service.updateCart(cart);
  }

  Future<void> deleteCart(int id) {
    return service.deleteCart(id);
  }
}
