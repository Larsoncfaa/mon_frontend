import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/delivery_predict.dart';
import '../../services/delivery_predict_service.dart';

import '../../core/network/dio_provider.dart';
import '../notifications/delivery_predict_notifier.dart';
import '../repositories/delivery_predict_repository.dart';

final deliveryPredictServiceProvider = Provider<DeliveryPredictService>((ref) {
  debugPrint("Provider: Creating DeliveryPredictService");
  return DeliveryPredictService(ref.watch(dioProvider)); // Injection du dioProvider
});

final deliveryPredictRepositoryProvider = Provider<DeliveryPredictRepository>((ref) {
  debugPrint("Provider: Creating DeliveryPredictRepository");
  return DeliveryPredictRepository(ref.watch(deliveryPredictServiceProvider)); // Repository qui utilise le service
});

final deliveryPredictNotifierProvider = StateNotifierProvider.autoDispose
    .family<DeliveryPredictNotifier, AsyncValue<List<DeliveryPredict>>, int>(
      (ref, productId) {
    debugPrint("Provider: Creating DeliveryPredictNotifier for productId: $productId");

    final notifier = DeliveryPredictNotifier(ref.watch(deliveryPredictRepositoryProvider));
    notifier.loadPredictions(productId); // On charge les prédictions au démarrage
    return notifier;
  },
);
