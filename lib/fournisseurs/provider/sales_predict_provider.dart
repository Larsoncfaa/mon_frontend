import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/sales_predict.dart';
import '../../services/sales_predict_service.dart';
import '../repositories/sales_predict_repository.dart';

/// 1. Service Provider
final salesPredictServiceProvider = Provider<SalesPredictService>((ref) {
  final dio = ref.watch(dioProvider);
  return SalesPredictService(dio);
});

/// 2. Repository Provider
final salesPredictRepositoryProvider = Provider<SalesPredictRepository>((ref) {
  final service = ref.watch(salesPredictServiceProvider);
  return SalesPredictRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class SalesPredictNotifier extends Notifier<AsyncValue<List<SalesPredict>>> {
  
  @override
  AsyncValue<List<SalesPredict>> build() {
    Future.microtask(() => loadPredictions());
    return const AsyncValue.loading();
  }

  // Charger toutes les prévisions de vente
  Future<void> loadPredictions() async {
    try {
      final repository = ref.read(salesPredictRepositoryProvider);
      final data = await repository.fetchAll();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Ajouter une nouvelle prévision de vente
  Future<void> addPrediction(SalesPredict prediction) async {
    try {
      final repository = ref.read(salesPredictRepositoryProvider);
      await repository.create(prediction);
      await loadPredictions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Mettre à jour une prévision de vente
  Future<void> updatePrediction(int id, SalesPredict updated) async {
    try {
      final repository = ref.read(salesPredictRepositoryProvider);
      await repository.update(id, updated);
      await loadPredictions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Supprimer une prévision de vente
  Future<void> deletePrediction(int id) async {
    try {
      final repository = ref.read(salesPredictRepositoryProvider);
      await repository.delete(id);
      await loadPredictions();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// 3. Notifier Provider (Riverpod 3.x)
final salesPredictNotifierProvider = NotifierProvider<
    SalesPredictNotifier, AsyncValue<List<SalesPredict>>>(
  SalesPredictNotifier.new,
);
