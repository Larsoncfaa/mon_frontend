import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/refund_request.dart';
import '../../models/refund_status_enum.dart';
import '../../services/refund_request_service.dart';
import '../repositories/refund_request_repository.dart';

/// 1. Service Provider
final refundRequestServiceProvider = Provider<RefundRequestService>((ref) {
  return RefundRequestService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final refundRequestRepositoryProvider = Provider<RefundRequestRepository>((ref) {
  return RefundRequestRepository(ref.watch(refundRequestServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class RefundRequestNotifier extends Notifier<AsyncValue<List<RefundRequest>>> {

  @override
  AsyncValue<List<RefundRequest>> build() {
    Future.microtask(() => loadAll());
    return const AsyncLoading();
  }

  Future<void> loadAll() async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(refundRequestRepositoryProvider);
      final data = await repository.fetchAll();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async => loadAll();

  Future<void> update(RefundRequest updated) async {
    try {
      final repository = ref.read(refundRequestRepositoryProvider);
      final saved = await repository.update(updated.id, updated);
      final current = state.value ?? [];
      state = AsyncData(current.map((r) => r.id == saved.id ? saved : r).toList());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<RefundRequest?> getById(int id) async {
    try {
      final repository = ref.read(refundRequestRepositoryProvider);
      return await repository.fetchOne(id);
    } catch (e) {
      debugPrint('RefundRequestNotifier: erreur récupération id=$id : $e');
      return null;
    }
  }

  Future<void> create(RefundRequest refundRequest) async {
    try {
      final repository = ref.read(refundRequestRepositoryProvider);
      final created = await repository.create(refundRequest);
      final current = state.value ?? [];
      state = AsyncData([...current, created]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> approuverRemboursement(int id) async {
    try {
      final current = state.value ?? [];
      final refund = current.firstWhere((r) => r.id == id);
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.approved);
      await update(updated);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> rejeterRemboursement(int id) async {
    try {
      final current = state.value ?? [];
      final refund = current.firstWhere((r) => r.id == id);
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.rejected);
      await update(updated);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final refundRequestNotifierProvider =
NotifierProvider<RefundRequestNotifier, AsyncValue<List<RefundRequest>>>(
  RefundRequestNotifier.new,
);
