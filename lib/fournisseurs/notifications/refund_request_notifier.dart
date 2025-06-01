// notifiers/refund_request_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/refund_request.dart';
import '../repositories/refund_request_repository.dart';

class RefundRequestNotifier extends StateNotifier<AsyncValue<List<RefundRequest>>> {
  final RefundRequestRepository repository;

  RefundRequestNotifier(this.repository) : super(const AsyncLoading()) {
    loadAll();
  }

  Future<void> loadAll() async {
    state = const AsyncLoading();
    try {
      final data = await repository.fetchAll();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await loadAll();
  }

  Future<void> update(RefundRequest updated) async {
    try {
      final saved = await repository.update(updated.id, updated); // <- ici
      final current = state.value ?? [];
      state = AsyncData(current.map((r) => r.id == saved.id ? saved : r).toList());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
  Future<RefundRequest?> getById(int id) async {
    try {
      return await repository.fetchOne(id);
    } catch (_) {
      return null;
    }

  }
  void create(RefundRequest refundRequest) async {
    try {
      final created = await repository.create(refundRequest);
      final current = state.value ?? [];
      state = AsyncData([...current, created]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
