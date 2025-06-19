import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/refund_request.dart';
import '../../models/refund_status_enum.dart';
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
      final saved = await repository.update(updated.id, updated);
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
      final result = await repository.fetchOne(id);
      debugPrint('RefundRequestNotifier: récupération id=$id réussie');
      return result;
    } catch (e) {
      debugPrint('RefundRequestNotifier: erreur récupération id=$id : $e');
      return null;
    }
  }

  Future<void> create(RefundRequest refundRequest) async {
    try {
      final created = await repository.create(refundRequest);
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
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.APPROVED);
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
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.REJECTED);
      await update(updated);
      debugPrint('RefundRequestNotifier: remboursement rejeté id=$id');
    } catch (e, st) {
      debugPrint('RefundRequestNotifier: erreur rejet: $e');
      state = AsyncError(e, st);
    }
  }
}
