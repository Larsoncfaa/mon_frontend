import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/delivery_predict.dart';
import '../../services/delivery_predict_service.dart';
import '../notifications/delivery_predict_notifier.dart';
import '../repositories/delivery_predict_repository.dart';



// Fournisseur du service
final deliveryPredictServiceProvider = Provider<DeliveryPredictService>(
      (ref) => DeliveryPredictService(ref.watch(dioProvider)),
);

// Fournisseur du repository
final deliveryPredictRepositoryProvider = Provider<DeliveryPredictRepository>(
      (ref) => DeliveryPredictRepository(ref.watch(deliveryPredictServiceProvider)),
);

// Fournisseur du notifier
final deliveryPredictNotifierProvider = StateNotifierProvider<DeliveryPredictNotifier, AsyncValue<DeliveryPredict>>(
      (ref) => DeliveryPredictNotifier(ref.watch(deliveryPredictRepositoryProvider)),
);
