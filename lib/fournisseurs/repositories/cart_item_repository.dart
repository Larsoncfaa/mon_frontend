import '../../models/cart_item.dart';
import '../../pagination/paginated_cart_item_list.dart';
import '../../services/cart_item_service.dart';

class CartItemRepository {
  final CartItemService service;

  CartItemRepository(this.service);

  Future<PaginatedCartItemList> fetchCartItems({int page = 1}) =>
      service.fetchCartItems(page: page);

  Future<CartItem> getCartItem(int id) => service.getCartItem(id);

  Future<CartItem> createCartItem(CartItem item) => service.createCartItem(item);

  Future<CartItem> updateCartItem(CartItem item) => service.updateCartItem(item);

  Future<void> deleteCartItem(int id) => service.deleteCartItem(id);

  Future<CartItem> addCartItem({
    required int cartId,
    required int productId,
    required int quantity,
  }) {
    return service.addCartItem(
      cartId: cartId,
      productId: productId,
      quantity: quantity,
    );
  }
}
