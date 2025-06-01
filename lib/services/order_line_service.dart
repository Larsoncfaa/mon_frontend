import 'package:dio/dio.dart';

import '../models/order_line.dart';
import '../pagination/paginated_order_line_list.dart';


class OrderLineService {
  final Dio _dio;

  OrderLineService(this._dio);

  Future<PaginatedOrderLineList> fetchOrderLines({int page = 1}) async {
    final response = await _dio.get('/v1/order-lines/', queryParameters: {'page': page});
    return PaginatedOrderLineList.fromJson(response.data);
  }

  Future<OrderLine> fetchOrderLine(int id) async {
    final response = await _dio.get('/v1/order-lines/$id/');
    return OrderLine.fromJson(response.data);
  }

  Future<OrderLine> createOrderLine(Map<String, dynamic> data) async {
    final response = await _dio.post('/v1/order-lines/', data: data);
    return OrderLine.fromJson(response.data);
  }

  Future<OrderLine> updateOrderLine(int id, Map<String, dynamic> data) async {
    final response = await _dio.put('/v1/order-lines/$id/', data: data);
    return OrderLine.fromJson(response.data);
  }

  Future<void> deleteOrderLine(int id) async {
    await _dio.delete('/v1/order-lines/$id/');
  }
}
