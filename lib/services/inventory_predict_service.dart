import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/inventory_predict.dart';

class InventoryPredictService {
  final Dio dio;

  InventoryPredictService(this.dio);

  /// Récupère les prédictions de stock pour un produit
  Future<List<InventoryPredict>> fetchInventoryPredictions({
    required int productId,
  }) async {
    try {
      debugPrint("Fetching inventory predictions for productId: $productId");

      final response = await dio.get('/predict/inventory/', queryParameters: {
        'product_id': productId,
      });

      debugPrint("Response data: ${response.data}");

      final List data = response.data as List;
      return data.map((e) => InventoryPredict.fromJson(e)).toList();
    } catch (e) {
      debugPrint("Error fetching inventory predictions: $e");
      throw Exception("Failed to fetch inventory predictions: $e");
    }
  }
}
