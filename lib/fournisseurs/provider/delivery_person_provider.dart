import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/delivery_person.dart';
import '../../pagination/paginated_delivery_person_list.dart';
import '../../services/delivery_person_service.dart';
import '../repositories/delivery_person_repository.dart';

/// 1. Service Provider
final deliveryPersonServiceProvider = Provider<DeliveryPersonService>((ref) {
  final dio = ref.watch(dioProvider);
  return DeliveryPersonService(dio);
});

/// 2. Repository Provider
final deliveryPersonRepositoryProvider = Provider<DeliveryPersonRepository>((ref) {
  final service = ref.watch(deliveryPersonServiceProvider);
  return DeliveryPersonRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class DeliveryPersonNotifier extends Notifier<AsyncValue<PaginatedDeliveryPersonList>> {
  @override
  AsyncValue<PaginatedDeliveryPersonList> build() {
    Future.microtask(() => loadPage());
    return const AsyncValue.loading();
  }

  /// 📥 Charge une page de livreurs (ou URL donnée)
  Future<void> loadPage({String? url}) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(deliveryPersonRepositoryProvider);
      final page = await repository.fetchPage(url: url);
      state = AsyncValue.data(page);
    } catch (e, st) {
      debugPrint('❌ [Notifier] Erreur loadPage: $e');
      state = AsyncValue.error(e, st);
    }
  }

  /// ⏭️ Charge la page suivante si disponible
  Future<void> loadNext() async {
    final page = state.value;
    if (page?.next != null) {
      await loadPage(url: page!.next);
    }
  }

  /// ⏮️ Charge la page précédente si disponible
  Future<void> loadPrevious() async {
    final page = state.value;
    if (page?.previous != null) {
      await loadPage(url: page!.previous);
    }
  }

  /// ✅ Marque une livraison comme livrée
  Future<void> markDelivered(int id) async {
    try {
      final repository = ref.read(deliveryPersonRepositoryProvider);
      await repository.markDelivered(id);
      await loadPage();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// 🔁 Réassigne une livraison à un nouveau livreur
  Future<void> reassign(int id, int newUserId) async {
    try {
      final repository = ref.read(deliveryPersonRepositoryProvider);
      await repository.reassign(id, newUserId);
      await loadPage();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createDeliveryPerson(Map<String, dynamic> data) async {
    try {
      final repository = ref.read(deliveryPersonRepositoryProvider);
      await repository.create(data);
      await loadPage();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  /// 🗑️ Supprime un livreur
  Future<void> delete(int id) async {
    try {
      final repository = ref.read(deliveryPersonRepositoryProvider);
      await repository.delete(id);
      await loadPage();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final deliveryPersonNotifierProvider = NotifierProvider<
    DeliveryPersonNotifier, AsyncValue<PaginatedDeliveryPersonList>>(
  DeliveryPersonNotifier.new,
);
