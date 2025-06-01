import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/inventory_predict.dart';
import '../../services/inventory_predict_service.dart';
import '../notifications/inventory_predict_notifier.dart';
import '../repositories/inventory_predict_repository.dart';




final inventoryPredictServiceProvider = Provider<InventoryPredictService>((ref) {
  return InventoryPredictService(ref.watch(dioProvider));
});

final inventoryPredictRepositoryProvider = Provider<InventoryPredictRepository>((ref) {
  return InventoryPredictRepository(ref.watch(inventoryPredictServiceProvider));
});

final inventoryPredictNotifierProvider = StateNotifierProvider.autoDispose
    .family<InventoryPredictNotifier, AsyncValue<List<InventoryPredict>>, int>(
      (ref, productId) {
    final notifier = InventoryPredictNotifier(ref.watch(inventoryPredictRepositoryProvider));
    notifier.loadPredictions(productId);
    return notifier;
  },
);
