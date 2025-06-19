import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/order_line.dart';
import '../pagination/paginated_order_line_list.dart';

class OrderLineService {
  final Dio _dio;

  OrderLineService(this._dio);

  Future<PaginatedOrderLineList> fetchOrderLines({int page = 1}) async {
    try {
      final response = await _dio.get('/order-lines/', queryParameters: {'page': page});
      return PaginatedOrderLineList.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("Erreur fetchOrderLines : ${e.response?.data}");
      rethrow;
    }
  }

  Future<OrderLine> fetchOrderLine(int id) async {
    try {
      final response = await _dio.get('/order-lines/$id/');
      return OrderLine.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("Erreur fetchOrderLine : ${e.response?.data}");
      rethrow;
    }
  }

  Future<OrderLine> createOrderLine(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/order-lines/', data: data);
      return OrderLine.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("Erreur createOrderLine : ${e.response?.data}");
      rethrow;
    }
  }

  Future<OrderLine> updateOrderLine(int id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put('/order-lines/$id/', data: data);
      return OrderLine.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("Erreur updateOrderLine : ${e.response?.data}");
      rethrow;
    }
  }

  Future<void> deleteOrderLine(int id) async {
    try {
      await _dio.delete('/order-lines/$id/');
    } on DioError catch (e) {
      debugPrint("Erreur deleteOrderLine : ${e.response?.data}");
      rethrow;
    }
  }
  Future<PaginatedOrderLineList> fetchOrderLinesByOrderId(int orderId, {int page = 1}) async {
    final response = await _dio.get('/order-lines/', queryParameters: {
      'order': orderId,
      'page': page,
    });
    return PaginatedOrderLineList.fromJson(response.data);
  }

}
