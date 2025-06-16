
import 'package:flutter/cupertino.dart';

import '../../models/inventory_predict.dart';
import '../../services/inventory_predict_service.dart';

class InventoryPredictRepository {
  final InventoryPredictService service;

  InventoryPredictRepository(this.service);

  /// Récupère toutes les prédictions de stock pour un produit
  Future<List<InventoryPredict>> fetchAll(int productId) async {
    debugPrint("Repository: Fetching all inventory predictions for productId: $productId");

    final predictions = await service.fetchInventoryPredictions(productId: productId);

    debugPrint("Repository: Fetched ${predictions.length} predictions.");
    return predictions;
  }
}
