import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/delivery_predict.dart';

class DeliveryPredictService {
  final Dio dio;

  DeliveryPredictService(this.dio);

  /// Récupère les prédictions de livraison pour un produit
  Future<List<DeliveryPredict>> fetchDeliveryPredictions({
    required int productId,
  }) async {
    try {
      debugPrint("Fetching delivery predictions for productId: $productId");

      final response = await dio.get('/predict/delivery/', queryParameters: {
        'product_id': productId,
      });

      debugPrint("Response data: ${response.data}");

      final List data = response.data as List;
      return data.map((e) => DeliveryPredict.fromJson(e)).toList();
    } catch (e) {
      debugPrint("Error fetching delivery predictions: $e");
      throw Exception("Failed to fetch delivery predictions: $e");
    }
  }
}
