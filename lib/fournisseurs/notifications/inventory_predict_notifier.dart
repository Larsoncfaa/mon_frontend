import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/inventory_predict.dart';
import '../repositories/inventory_predict_repository.dart';

class InventoryPredictNotifier extends StateNotifier<AsyncValue<List<InventoryPredict>>> {
  final InventoryPredictRepository repository;

  InventoryPredictNotifier(this.repository) : super(const AsyncLoading());

  /// Charge les prédictions pour un produit donné
  Future<void> loadPredictions(int productId) async {
    debugPrint("Notifier: Loading inventory predictions for productId: $productId");

    try {
      final data = await repository.fetchAll(productId); // On récupère les données via le repository
      state = AsyncData(data);  // Met à jour l'état avec les données récupérées
      debugPrint("Notifier: Successfully loaded ${data.length} predictions.");
    } catch (e, st) {
      debugPrint("Notifier: Error loading inventory predictions: $e");
      state = AsyncError(e, st);  // En cas d'erreur, on met l'état à AsyncError
    }
  }
}
