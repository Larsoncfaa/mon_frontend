import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/inventory_predict.dart';
import '../repositories/inventory_predict_repository.dart';

// Provider du repository (à ajuster selon ton projet)
final inventoryPredictRepositoryProvider = Provider<InventoryPredictRepository>((ref) {
  throw UnimplementedError('Initialisez votre InventoryPredictRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class InventoryPredictNotifier extends Notifier<AsyncValue<List<InventoryPredict>>> {
  late final InventoryPredictRepository _repository;

  @override
  AsyncValue<List<InventoryPredict>> build() {
    _repository = ref.watch(inventoryPredictRepositoryProvider);
    // On retourne une liste vide initiale ou AsyncLoading() selon le besoin
    return const AsyncValue.data([]);
  }

  /// Charge les prédictions pour un produit donné
  Future<void> loadPredictions(int productId) async {
    debugPrint("Notifier: Loading inventory predictions for productId: $productId");
    state = const AsyncLoading();

    try {
      final data = await _repository.fetchAll(productId);
      state = AsyncData(data);
      debugPrint("Notifier: Successfully loaded ${data.length} predictions.");
    } catch (e, st) {
      debugPrint("Notifier: Error loading inventory predictions: $e");
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final inventoryPredictNotifierProvider = NotifierProvider<
    InventoryPredictNotifier, AsyncValue<List<InventoryPredict>>>(
  InventoryPredictNotifier.new,
);