import 'package:dio/dio.dart';
import '../models/inventory_predict.dart';

class InventoryPredictService {
  final Dio dio;

  InventoryPredictService(this.dio);

  /// Récupère les prédictions de stock pour un produit
  Future<List<InventoryPredict>> fetchInventoryPredictions({
    required int productId,
  }) async {
    final response = await dio.get('v1/predict/inventory/', queryParameters: {
      'product_id': productId,
    });

    final List data = response.data as List;
    return data.map((e) => InventoryPredict.fromJson(e)).toList();
  }
}
