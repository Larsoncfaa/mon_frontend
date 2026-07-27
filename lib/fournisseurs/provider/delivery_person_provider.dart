import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../../core/network/dio_provider.dart';
import '../../models/delivery_person.dart';
import '../../pagination/paginated_delivery_person_list.dart';
import '../../services/delivery_person_service.dart';
import '../notifications/delivery_person_notifier.dart';
import '../repositories/delivery_person_repository.dart';

/// 🔧 Service
final deliveryPersonServiceProvider = Provider<DeliveryPersonService>((ref) {
  final dio = ref.watch(dioProvider);
  debugPrint('🔧 [Provider] Création du DeliveryPersonService');
  return DeliveryPersonService(dio);
});

/// 🗂️ Repository
final deliveryPersonRepositoryProvider = Provider<DeliveryPersonRepository>((ref) {
  final service = ref.watch(deliveryPersonServiceProvider);
  debugPrint('📦 [Provider] Création du DeliveryPersonRepository');
  return DeliveryPersonRepository(service);
});

/// 📢 Notifier paginé (Riverpod 3.x)
final deliveryPersonNotifierProvider =
NotifierProvider<DeliveryPersonNotifier, AsyncValue<PaginatedDeliveryPersonList>>(
  DeliveryPersonNotifier.new,
);