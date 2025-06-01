


import '../../models/inventory_predict.dart';
import '../../services/inventory_predict_service.dart';

class InventoryPredictRepository {
  final InventoryPredictService service;

  InventoryPredictRepository(this.service);

  /// Retourne les prédictions d'inventaire pour un produit
  Future<List<InventoryPredict>> getPredictions(int productId) {
    return service.fetchInventoryPredictions(productId: productId);
  }
}
