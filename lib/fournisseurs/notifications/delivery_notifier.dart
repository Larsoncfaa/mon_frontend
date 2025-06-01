import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/delivery.dart';
import '../repositories/delivery_repository.dart';



class DeliveryNotifier extends StateNotifier<AsyncValue<List<Delivery>>> {
  final DeliveryRepository _repository;

  DeliveryNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadDeliveries();
  }

  Future<void> loadDeliveries({int page = 1}) async {
    try {
      final deliveries = await _repository.getDeliveries(page: page);
      state = AsyncValue.data(deliveries.results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Crée une nouvelle livraison et met à jour la liste
  Future<void> createDelivery(Delivery newDelivery) async {
    try {
      final created = await _repository.createDelivery(newDelivery);
      final previous = state.value ?? [];
      state = AsyncValue.data([...previous, created]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Met à jour une livraison dans la liste locale
  Future<void> updateDelivery(int id, Delivery updatedDelivery) async {
    try {
      final updated = await _repository.updateDelivery(id, updatedDelivery);
      final previous = state.value ?? [];
      final updatedList = previous.map((d) => d.id == id ? updated : d).toList();
      state = AsyncValue.data(updatedList);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Supprime une livraison de la liste locale
  Future<void> deleteDelivery(int id) async {
    try {
      await _repository.deleteDelivery(id);
      final previous = state.value ?? [];
      final updatedList = previous.where((d) => d.id != id).toList();
      state = AsyncValue.data(updatedList);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  // Méthodes métiers (vide pour l’instant)
  void startDelivery(int id) {}
  void completeDelivery(int id) {}
  void refundDelivery(int id) {}
}
