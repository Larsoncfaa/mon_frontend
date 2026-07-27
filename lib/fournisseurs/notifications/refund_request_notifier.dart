import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/refund_request.dart';
import '../../models/refund_status_enum.dart';
import '../repositories/refund_request_repository.dart';

// Provider du repository (à adapter selon ton projet)
final refundRequestRepositoryProvider = Provider<RefundRequestRepository>((ref) {
  throw UnimplementedError('Initialisez votre RefundRequestRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class RefundRequestNotifier extends Notifier<AsyncValue<List<RefundRequest>>> {
  late final RefundRequestRepository _repository;

  @override
  AsyncValue<List<RefundRequest>> build() {
    _repository = ref.watch(refundRequestRepositoryProvider);
    loadAll();
    return const AsyncLoading();
  }

  Future<void> loadAll() async {
    state = const AsyncLoading();
    try {
      final data = await _repository.fetchAll();
      debugPrint('RefundRequestNotifier: chargement réussi');
      state = AsyncData(data);
    } catch (e, st) {
      debugPrint('RefundRequestNotifier: erreur chargement: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async => loadAll();

  Future<void> update(RefundRequest updated) async {
    try {
      final saved = await _repository.update(updated.id, updated);
      final current = state.value ?? [];
      debugPrint('RefundRequestNotifier: mise à jour id=${updated.id} réussie');
      state = AsyncData(current.map((r) => r.id == saved.id ? saved : r).toList());
    } catch (e, st) {
      debugPrint('RefundRequestNotifier: erreur mise à jour: $e');
      state = AsyncError(e, st);
    }
  }

  Future<RefundRequest?> getById(int id) async {
    try {
      final result = await _repository.fetchOne(id);
      debugPrint('RefundRequestNotifier: récupération id=$id réussie');
      return result;
    } catch (e) {
      debugPrint('RefundRequestNotifier: erreur récupération id=$id : $e');
      return null;
    }
  }

  Future<void> create(RefundRequest refundRequest) async {
    try {
      final created = await _repository.create(refundRequest);
      final current = state.value ?? [];
      debugPrint('RefundRequestNotifier: création réussie id=${created.id}');
      state = AsyncData([...current, created]);
    } catch (e, st) {
      debugPrint('RefundRequestNotifier: erreur création: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> approuverRemboursement(int id) async {
    try {
      final current = state.value ?? [];
      final refund = current.firstWhere((r) => r.id == id);
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.approved);
      await update(updated);
      debugPrint('RefundRequestNotifier: remboursement approuvé id=$id');
    } catch (e, st) {
      debugPrint('RefundRequestNotifier: erreur approbation: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> rejeterRemboursement(int id) async {
    try {
      final current = state.value ?? [];
      final refund = current.firstWhere((r) => r.id == id);
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.rejected);
      await update(updated);
      debugPrint('RefundRequestNotifier: remboursement rejeté id=$id');
    } catch (e, st) {
      debugPrint('RefundRequestNotifier: erreur rejet: $e');
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final refundRequestNotifierProvider = NotifierProvider<
    RefundRequestNotifier, AsyncValue<List<RefundRequest>>>(
  RefundRequestNotifier.new,
);