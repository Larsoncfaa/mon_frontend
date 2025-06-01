import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/delivery_predict.dart';
import '../repositories/delivery_predict_repository.dart';

class DeliveryPredictNotifier extends StateNotifier<AsyncValue<DeliveryPredict>> {
  final DeliveryPredictRepository _repository;

  DeliveryPredictNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> predict(int productId, int quantity) async {
    state = const AsyncValue.loading();
    try {
      final prediction = await _repository.predictDelivery(
        productId: productId,
        quantity: quantity,
      );
      state = AsyncValue.data(prediction);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
