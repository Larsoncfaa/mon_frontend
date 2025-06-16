import 'package:dio/dio.dart';

import '../models/delivery.dart';
import '../pagination/paginated_delivery.dart';


class DeliveryService {
  final Dio _dio;

  DeliveryService(this._dio);

  Future<PaginatedDelivery> fetchDeliveries({int page = 1}) async {
    final response = await _dio.get('/deliveries/', queryParameters: {'page': page});
    return PaginatedDelivery.fromJson(response.data);
  }

  Future<Delivery> fetchDelivery(int id) async {
    final response = await _dio.get('/deliveries/$id/');
    return Delivery.fromJson(response.data);
  }

  Future<Delivery> createDelivery(Delivery delivery) async {
    final response = await _dio.post('/deliveries/', data: delivery.toJson());
    return Delivery.fromJson(response.data);
  }

  Future<Delivery> updateDelivery(int id, Delivery delivery) async {
    final response = await _dio.put('/deliveries/$id/', data: delivery.toJson());
    return Delivery.fromJson(response.data);
  }

  Future<void> deleteDelivery(int id) async {
    await _dio.delete('/deliveries/$id/');
  }
}
