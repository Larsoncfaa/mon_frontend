import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/delivery.dart';
import '../pagination/paginated_delivery.dart';

class DeliveryService {
  final Dio _dio;

  DeliveryService(this._dio);

  Future<PaginatedDelivery> fetchDeliveries({int page = 1}) async {
    try {
      debugPrint('Fetching deliveries (page $page)...');
      final response = await _dio.get('/deliveries/', queryParameters: {'page': page});
      debugPrint('Deliveries response: ${response.data}');
      return PaginatedDelivery.fromJson(response.data);
    } catch (e, stack) {
      debugPrint('Error fetching deliveries: $e');
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }

  Future<Delivery> fetchDelivery(int id) async {
    try {
      debugPrint('Fetching delivery with id $id...');
      final response = await _dio.get('/deliveries/$id/');
      debugPrint('Delivery response: ${response.data}');
      return Delivery.fromJson(response.data);
    } catch (e, stack) {
      debugPrint('Error fetching delivery $id: $e');
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }

  Future<Delivery> createDelivery(Delivery delivery) async {
    try {
      debugPrint('Creating delivery: ${delivery.toJson()}');
      final response = await _dio.post('/deliveries/', data: delivery.toJson());
      debugPrint('Created delivery: ${response.data}');
      return Delivery.fromJson(response.data);
    } catch (e, stack) {
      debugPrint('Error creating delivery: $e');
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }

  Future<Delivery> updateDelivery(int id, Delivery delivery) async {
    try {
      debugPrint('Updating delivery $id with: ${delivery.toJson()}');
      final response = await _dio.put('/deliveries/$id/', data: delivery.toJson());
      debugPrint('Updated delivery: ${response.data}');
      return Delivery.fromJson(response.data);
    } catch (e, stack) {
      debugPrint('Error updating delivery $id: $e');
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }

  Future<void> deleteDelivery(int id) async {
    try {
      debugPrint('Deleting delivery with id $id...');
      await _dio.delete('/deliveries/$id/');
      debugPrint('Delivery $id deleted successfully.');
    } catch (e, stack) {
      debugPrint('Error deleting delivery $id: $e');
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }
}
