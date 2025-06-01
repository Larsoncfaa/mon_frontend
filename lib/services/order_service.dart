import 'package:dio/dio.dart';
import '../models/order.dart';
import '../pagination/paginated_order_list.dart';

class OrderService {
  final Dio dio;

  OrderService(this.dio);

  Future<PaginatedOrderList> fetchOrders({int page = 1}) async {
    final response = await dio.get('/v1/orders/', queryParameters: {'page': page});
    return PaginatedOrderList.fromJson(response.data);
  }

  Future<Order> getOrder(int id) async {
    final response = await dio.get('/v1/orders/$id/');
    return Order.fromJson(response.data);
  }

  Future<Order> createOrder(Order order) async {
    final data = order.toJson()..remove('id');
    final response = await dio.post('/v1/orders/', data: data);
    return Order.fromJson(response.data);
  }

  Future<Order> updateOrder(Order order) async {
    final data = order.toJson();
    final response = await dio.put('/v1/orders/${order.id}/', data: data);
    return Order.fromJson(response.data);
  }

  Future<void> deleteOrder(int id) async {
    await dio.delete('/v1/orders/$id/');
  }
}
