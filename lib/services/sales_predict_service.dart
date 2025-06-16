// services/sales_predict_service.dart

import 'package:dio/dio.dart';
import '../models/sales_predict.dart';

class SalesPredictService {
  final Dio _dio;

  SalesPredictService(this._dio);

  // Récupérer toutes les prévisions de ventes
  Future<List<SalesPredict>> getAllSalesPredictions() async {
    final response = await _dio.get('/sales-predict/');
    return (response.data as List)
        .map((json) => SalesPredict.fromJson(json))
        .toList();
  }

  // Récupérer une prévision de vente par ID
  Future<SalesPredict> getSalesPrediction(int id) async {
    final response = await _dio.get('/sales-predict/$id/');
    return SalesPredict.fromJson(response.data);
  }

  // Créer une prévision de vente
  Future<SalesPredict> createSalesPrediction(SalesPredict data) async {
    final response = await _dio.post(
      '/sales-predict/',  // L'URL de création d'une prévision
      data: data.toJson(),
    );
    return SalesPredict.fromJson(response.data);
  }

  // Mettre à jour une prévision de vente
  Future<SalesPredict> updateSalesPrediction(int id, SalesPredict data) async {
    final response = await _dio.put(
      '/sales-predict/$id/',
      data: data.toJson(),
    );
    return SalesPredict.fromJson(response.data);
  }

  // Supprimer une prévision de vente
  Future<void> deleteSalesPrediction(int id) async {
    await _dio.delete('/sales-predict/$id/');
  }
}
