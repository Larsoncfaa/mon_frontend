// notifiers/sales_predict_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/sales_predict.dart';
import '../repositories/sales_predict_repository.dart';

class SalesPredictNotifier extends StateNotifier<AsyncValue<List<SalesPredict>>> {
  final SalesPredictRepository repository;

  SalesPredictNotifier(this.repository) : super(const AsyncLoading()) {
    loadPredictions();
  }

  Future<void> loadPredictions() async {
    try {
      final data = await repository.fetchAll();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addPrediction(SalesPredict prediction) async {
    try {
      await repository.create(prediction);
      await loadPredictions();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updatePrediction(int id, SalesPredict updated) async {
    try {
      await repository.update(id, updated);
      await loadPredictions();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deletePrediction(int id) async {
    try {
      await repository.delete(id);
      await loadPredictions();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
