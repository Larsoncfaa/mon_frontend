import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/delivery_predict.dart';
import '../repositories/delivery_predict_repository.dart';

class DeliveryPredictNotifier extends StateNotifier<AsyncValue<List<DeliveryPredict>>> {
  final DeliveryPredictRepository repository;

  DeliveryPredictNotifier(this.repository) : super(const AsyncLoading());

  /// Charge les prédictions de livraison pour un produit donné
  Future<void> loadPredictions(int productId) async {
    debugPrint("Notifier: Loading delivery predictions for productId: $productId");

    try {
      final data = await repository.fetchAll(productId); // On récupère les données via le repository
      state = AsyncData(data);  // Met à jour l'état avec les données récupérées
      debugPrint("Notifier: Successfully loaded ${data.length} delivery predictions.");
    } catch (e, st) {
      debugPrint("Notifier: Error loading delivery predictions: $e");
      state = AsyncError(e, st);  // En cas d'erreur, on met l'état à AsyncError
    }
  }
}
