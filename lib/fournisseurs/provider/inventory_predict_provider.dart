import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/inventory_predict.dart';
import '../../services/inventory_predict_service.dart';
import '../repositories/inventory_predict_repository.dart';

/// Provider pour le Service
final inventoryPredictServiceProvider = Provider<InventoryPredictService>((ref) {
  return InventoryPredictService(ref.watch(dioProvider));
});

/// Provider pour le Repository
final inventoryPredictRepositoryProvider = Provider<InventoryPredictRepository>((ref) {
  return InventoryPredictRepository(ref.watch(inventoryPredictServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x (Gestion par Famille)
class InventoryPredictNotifier extends Notifier<AsyncValue<List<InventoryPredict>>> {
  final int productId;

  InventoryPredictNotifier(this.productId);

  @override
  AsyncValue<List<InventoryPredict>> build() {
    _loadInitial();
    return const AsyncValue.loading();
  }

  void _loadInitial() {
    Future.microtask(() => loadPredictions());
  }

  Future<void> loadPredictions() async {
    try {
      final repository = ref.read(inventoryPredictRepositoryProvider);
      final data = await repository.fetchAll(productId);
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider du Notifier (Famille + AutoDispose)
final inventoryPredictNotifierProvider = NotifierProvider.autoDispose.family<
    InventoryPredictNotifier, AsyncValue<List<InventoryPredict>>, int>(
  InventoryPredictNotifier.new,
);
