import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/delivery.dart';
import '../../services/delivery_service.dart';
import '../notifications/delivery_notifier.dart';
import '../repositories/delivery_repository.dart';




// Service Provider
final deliveryServiceProvider = Provider<DeliveryService>((ref) {
  final dio = ref.watch(dioProvider);
  return DeliveryService(dio);
});

// Repository Provider
final deliveryRepositoryProvider = Provider<DeliveryRepository>((ref) {
  final service = ref.watch(deliveryServiceProvider);
  return DeliveryRepository(service);
});

// Notifier Provider
final deliveryNotifierProvider = StateNotifierProvider<DeliveryNotifier, AsyncValue<List<Delivery>>>(
      (ref) {
    final repository = ref.watch(deliveryRepositoryProvider);
    return DeliveryNotifier(repository);
  },
);
