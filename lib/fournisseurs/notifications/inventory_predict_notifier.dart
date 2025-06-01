import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/inventory_predict.dart';
import '../repositories/inventory_predict_repository.dart';

class InventoryPredictNotifier extends StateNotifier<AsyncValue<List<InventoryPredict>>> {
  final InventoryPredictRepository repository;

  InventoryPredictNotifier(this.repository) : super(const AsyncValue.loading());

  Future<void> loadPredictions(int productId) async {
    state = const AsyncValue.loading();
    try {
      final predictions = await repository.getPredictions(productId);
      state = AsyncValue.data(predictions);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
