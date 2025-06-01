

import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../../services/order_service.dart';

class OrderRepository {
  final OrderService service;

  OrderRepository(this.service);

  Future<PaginatedOrderList> fetchOrders({int page = 1}) {
    return service.fetchOrders(page: page);
  }

  Future<Order> getOrder(int id) {
    return service.getOrder(id);
  }

  Future<Order> createOrder(Order order) {
    return service.createOrder(order);
  }

  Future<Order> updateOrder(Order order) {
    return service.updateOrder(order);
  }

  Future<void> deleteOrder(int id) {
    return service.deleteOrder(id);
  }
}
