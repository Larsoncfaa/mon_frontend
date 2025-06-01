// 📦 FICHIER : lib/providers/delivery_person_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/delivery_person.dart';
import '../../services/delivery_person_service.dart';
import '../notifications/delivery_person_notifier.dart';
import '../repositories/delivery_person_repository.dart';




/// Service
final deliveryPersonServiceProvider = Provider<DeliveryPersonService>((ref) {
  final dio = ref.watch(dioProvider);
  return DeliveryPersonService(dio);
});

/// Repository
final deliveryPersonRepositoryProvider = Provider<DeliveryPersonRepository>((ref) {
  final service = ref.watch(deliveryPersonServiceProvider);
  return DeliveryPersonRepository(service);
});

/// Notifier paginé
final deliveryPersonNotifierProvider = StateNotifierProvider<DeliveryPersonNotifier, AsyncValue<PaginatedDeliveryPersonList>>(
      (ref) {
    final repository = ref.watch(deliveryPersonRepositoryProvider);
    return DeliveryPersonNotifier(repository);
  },
);
