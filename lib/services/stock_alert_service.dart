import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../models/stock_alert.dart';
import '../pagination/paginated_stock_alert_list.dart';

class StockAlertService {
  final Dio dio;

  StockAlertService(this.dio);

  Future<PaginatedStockAlertList> fetchStockAlerts({int page = 1}) async {
    final response = await dio.get('/v1/stock-alerts/', queryParameters: {'page': page});
    return PaginatedStockAlertList.fromJson(response.data);
  }

  Future<StockAlert> getStockAlert(int id) async {
    final response = await dio.get('/v1/stock-alerts/$id/');
    return StockAlert.fromJson(response.data);
  }

  Future<StockAlert> createStockAlert(StockAlert alert) async {
    final data = alert.toJson()..remove('id');
    final response = await dio.post('/v1/stock-alerts/', data: data);
    return StockAlert.fromJson(response.data);
  }

  Future<StockAlert> updateStockAlert(StockAlert alert) async {
    final response = await dio.put('/v1/stock-alerts/${alert.id}/', data: alert.toJson());
    return StockAlert.fromJson(response.data);
  }

  Future<void> deleteStockAlert(int id) async {
    await dio.delete('/v1/stock-alerts/$id/');
  }

  when({required Column Function(dynamic alerts) data, required Center Function() loading, required Text Function(dynamic err, dynamic _) error}) {}
}
