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
      final saved = await repository.update(updated.id, updated);
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

  Future<void> create(RefundRequest refundRequest) async {
    try {
      final created = await repository.create(refundRequest);
      final current = state.value ?? [];
      state = AsyncData([...current, created]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Méthode appelée pour approuver une demande de remboursement
  Future<void> approuverRemboursement(int id) async {
    try {
      final current = state.value ?? [];
      final refund = current.firstWhere((r) => r.id == id);
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.APPROVED);
      await update(updated);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Méthode appelée pour rejeter une demande de remboursement
  Future<void> rejeterRemboursement(int id) async {
    try {
      final current = state.value ?? [];
      final refund = current.firstWhere((r) => r.id == id);
      final updated = refund.copyWith(refundStatus: RefundStatusEnum.REJECTED);
      await update(updated);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
