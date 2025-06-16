// notifiers/sales_predict_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/sales_predict.dart';
import '../repositories/sales_predict_repository.dart';

class SalesPredictNotifier extends StateNotifier<AsyncValue<List<SalesPredict>>> {
  final SalesPredictRepository repository;

  SalesPredictNotifier(this.repository) : super(const AsyncLoading()) {
    loadPredictions();
  }

  // Charger toutes les prévisions de vente
  Future<void> loadPredictions() async {
    try {
      final data = await repository.fetchAll();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  // Ajouter une nouvelle prévision de vente
  Future<void> addPrediction(SalesPredict prediction) async {
    try {
      await repository.create(prediction);
      await loadPredictions();  // Recharger après l'ajout
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  // Mettre à jour une prévision de vente
  Future<void> updatePrediction(int id, SalesPredict updated) async {
    try {
      await repository.update(id, updated);
      await loadPredictions();  // Recharger après la mise à jour
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  // Supprimer une prévision de vente
  Future<void> deletePrediction(int id) async {
    try {
      await repository.delete(id);
      await loadPredictions();  // Recharger après la suppression
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
