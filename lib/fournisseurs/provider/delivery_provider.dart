import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/delivery.dart';
import '../../services/delivery_service.dart';
import '../repositories/delivery_repository.dart';

// 1. Service Provider
final deliveryServiceProvider = Provider<DeliveryService>((ref) {
  final dio = ref.watch(dioProvider);
  return DeliveryService(dio);
});

// 2. Repository Provider
final deliveryRepositoryProvider = Provider<DeliveryRepository>((ref) {
  final service = ref.watch(deliveryServiceProvider);
  return DeliveryRepository(service);
});

/// Notifier moderne pour Riverpod 3.x gérant la liste des livraisons
class DeliveryNotifier extends Notifier<AsyncValue<List<Delivery>>> {
  
  @override
  AsyncValue<List<Delivery>> build() {
    Future.microtask(() => fetchDeliveries());
    return const AsyncValue.loading();
  }

  Future<void> fetchDeliveries() async {
    try {
      final repository = ref.read(deliveryRepositoryProvider);
      final paginated = await repository.getDeliveries();
      state = AsyncValue.data(paginated.results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteDelivery(int id) async {
    try {
      final repository = ref.read(deliveryRepositoryProvider);
      await repository.deleteDelivery(id);
      await fetchDeliveries();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> _updateStatus(int id, DeliveryStatusEnum status) async {
    try {
      final repository = ref.read(deliveryRepositoryProvider);
      final deliveries = state.value ?? [];
      final delivery = deliveries.firstWhere((d) => d.id == id);
      
      final updated = delivery.copyWith(deliveryStatus: status);
      await repository.updateDelivery(id, updated);
      await fetchDeliveries();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> startDelivery(int id) async {
    await _updateStatus(id, DeliveryStatusEnum.EN_COURS);
  }

  Future<void> completeDelivery(int id) async {
    await _updateStatus(id, DeliveryStatusEnum.TERMINEE);
  }

  Future<void> refundDelivery(int id) async {
    // Logique spécifique si besoin, sinon juste refresh ou update status
    await fetchDeliveries();
  }
}

// 3. Notifier Provider (Riverpod 3.x)
final deliveryNotifierProvider =
NotifierProvider<DeliveryNotifier, AsyncValue<List<Delivery>>>(
  DeliveryNotifier.new,
);
