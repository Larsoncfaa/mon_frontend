import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/delivery_predict.dart';
import '../../services/delivery_predict_service.dart';
import '../repositories/delivery_predict_repository.dart';

/// Provider pour le Service
final deliveryPredictServiceProvider = Provider<DeliveryPredictService>((ref) {
  return DeliveryPredictService(ref.watch(dioProvider));
});

/// Provider pour le Repository
final deliveryPredictRepositoryProvider = Provider<DeliveryPredictRepository>((ref) {
  return DeliveryPredictRepository(ref.watch(deliveryPredictServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x (Gestion par Famille)
class DeliveryPredictNotifier extends Notifier<AsyncValue<List<DeliveryPredict>>> {
  final int productId;

  // En Riverpod 3, les arguments de famille passent par le constructeur
  DeliveryPredictNotifier(this.productId);

  @override
  AsyncValue<List<DeliveryPredict>> build() {
    // On lance le chargement initial
    Future.microtask(() => loadPredictions());
    return const AsyncValue.loading();
  }

  Future<void> loadPredictions() async {
    // Pas besoin de mettre state = loading ici si on vient du build, 
    // mais utile pour les rafraîchissements manuels
    // state = const AsyncValue.loading(); 

    try {
      final repository = ref.read(deliveryPredictRepositoryProvider);
      final data = await repository.fetchAll(productId);
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider du Notifier (Famille + AutoDispose)
final deliveryPredictNotifierProvider = NotifierProvider.autoDispose.family<
    DeliveryPredictNotifier, AsyncValue<List<DeliveryPredict>>, int>(
  DeliveryPredictNotifier.new,
);
