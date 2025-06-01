// services/sales_predict_service.dart

import 'package:dio/dio.dart';
import '../models/sales_predict.dart';

class SalesPredictService {
  final Dio _dio;

  SalesPredictService(this._dio);

  Future<List<SalesPredict>> getAllSalesPredictions() async {
    final response = await _dio.get('/v1/sales-predict/');
    return (response.data as List)
        .map((json) => SalesPredict.fromJson(json))
        .toList();
  }

  Future<SalesPredict> getSalesPrediction(int id) async {
    final response = await _dio.get('/v1/sales-predict/$id/');
    return SalesPredict.fromJson(response.data);
  }

  Future<SalesPredict> createSalesPrediction(SalesPredict data) async {
    final response = await _dio.post('/v1/sales-predict/', data: data.toJson());
    return SalesPredict.fromJson(response.data);
  }

  Future<SalesPredict> updateSalesPrediction(int id, SalesPredict data) async {
    final response =
    await _dio.put('/v1/sales-predict/$id/', data: data.toJson());
    return SalesPredict.fromJson(response.data);
  }

  Future<void> deleteSalesPrediction(int id) async {
    await _dio.delete('/v1/sales-predict/$id/');
  }
}
