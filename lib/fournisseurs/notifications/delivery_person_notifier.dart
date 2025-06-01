
// 📦 FICHIER : lib/notifiers/delivery_person_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/delivery_person.dart';
import '../repositories/delivery_person_repository.dart';

class DeliveryPersonNotifier extends StateNotifier<AsyncValue<PaginatedDeliveryPersonList>> {
  final DeliveryPersonRepository _repository;
  DeliveryPersonNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadPage();
  }

  Future<void> loadPage({String? url}) async {
    state = const AsyncValue.loading();
    try {
      final page = await _repository.fetchPage(url: url);
      state = AsyncValue.data(page);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadNext() async {
    final page = state.value;
    if (page?.next != null) {
      await loadPage(url: page!.next);
    }
  }

  Future<void> loadPrevious() async {
    final page = state.value;
    if (page?.previous != null) {
      await loadPage(url: page!.previous);
    }
  }

  Future<void> markDelivered(int id) async {
    try {
      await _repository.markDelivered(id);
      // rafraîchir la page courante
      final current = state.value;
      await loadPage(url: current?.next == null && current?.previous == null ? null : null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> reassign(int id, int newUserId) async {
    try {
      await _repository.reassign(id, newUserId);
      final current = state.value;
      await loadPage(url: current?.next == null && current?.previous == null ? null : null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

