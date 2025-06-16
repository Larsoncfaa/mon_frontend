import 'package:flutter/foundation.dart';

import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../../services/order_service.dart';

class OrderRepository {
  final OrderService service;

  OrderRepository(this.service);

  Future<PaginatedOrderList> fetchOrders({int page = 1}) async {
    try {
      return await service.fetchOrders(page: page);
    } catch (e) {
      debugPrint('Erreur fetchOrders: $e');
      rethrow;
    }
  }

  Future<Order> getOrder(int id) async {
    try {
      return await service.getOrder(id);
    } catch (e) {
      debugPrint('Erreur getOrder: $e');
      rethrow;
    }
  }

  Future<Order> createOrder(Order order) async {
    try {
      return await service.createOrder(order);
    } catch (e) {
      debugPrint('Erreur createOrder: $e');
      rethrow;
    }
  }

  Future<Order> updateOrder(Order order) async {
    try {
      return await service.updateOrder(order);
    } catch (e) {
      debugPrint('Erreur updateOrder: $e');
      rethrow;
    }
  }

  Future<void> deleteOrder(int id) async {
    try {
      await service.deleteOrder(id);
    } catch (e) {
      debugPrint('Erreur deleteOrder: $e');
      rethrow;
    }
  }

  /// ✅ Ajout du paramètre cartId ici aussi
  Future<Order> createOrderFromCart() async {
    try {
      return await service.createOrderFromCart();
    } catch (e) {
      debugPrint('Erreur createOrderFromCart: $e');
      rethrow;
    }
  }
}
