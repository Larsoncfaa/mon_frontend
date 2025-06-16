import 'package:flutter/cupertino.dart';
import '../../models/delivery_predict.dart';
import '../../services/delivery_predict_service.dart';

class DeliveryPredictRepository {
  final DeliveryPredictService service;

  DeliveryPredictRepository(this.service);

  /// Récupère toutes les prédictions de livraison pour un produit
  Future<List<DeliveryPredict>> fetchAll(int productId) async {
    debugPrint("Repository: Fetching all delivery predictions for productId: $productId");

    final predictions = await service.fetchDeliveryPredictions(productId: productId);

    debugPrint("Repository: Fetched ${predictions.length} delivery predictions.");
    return predictions;
  }
}
