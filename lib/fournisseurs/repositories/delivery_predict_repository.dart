

import '../../models/delivery_predict.dart';
import '../../services/delivery_predict_service.dart';

class DeliveryPredictRepository {
  final DeliveryPredictService _service;

  DeliveryPredictRepository(this._service);

  Future<DeliveryPredict> predictDelivery({
    required int productId,
    required int quantity,
  }) {
    return _service.predictDelivery(
      productId: productId,
      quantity: quantity,
    );
  }
}
