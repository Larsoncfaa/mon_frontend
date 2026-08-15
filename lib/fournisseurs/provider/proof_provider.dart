import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_proof_list.dart';
import '../../services/proof_service.dart';
import '../repositories/proof_repository.dart';

/// 1. Service Provider
final proofServiceProvider = Provider<ProofService>((ref) {
  return ProofService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final proofRepositoryProvider = Provider<ProofRepository>((ref) {
  return ProofRepository(ref.watch(proofServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class ProofNotifier extends Notifier<AsyncValue<PaginatedProofList>> {
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedProofList> build() {
    Future.microtask(() => loadProofs());
    return const AsyncLoading();
  }

  Future<void> loadProofs({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(proofRepositoryProvider);
      final proofs = await repository.getProofs(page: page);
      _currentPage = page;
      state = AsyncData(proofs);
    } catch (e, st) {
      state = AsyncError(Exception('Erreur lors du chargement des preuves : $e'), st);
    }
  }

  Future<void> refresh() async {
    await loadProofs(page: _currentPage);
  }

  /// Supprime une preuve par son ID et recharge la liste
  Future<void> delete(int id) async {
    try {
      final repository = ref.read(proofRepositoryProvider);
      await repository.deleteProof(id);
      await loadProofs(page: _currentPage);
    } catch (e, st) {
      state = AsyncError(Exception('Erreur lors de la suppression de la preuve : $e'), st);
    }
  }
}

/// 3. Notifier Provider principal
final proofNotifierProvider =
NotifierProvider<ProofNotifier, AsyncValue<PaginatedProofList>>(
  ProofNotifier.new,
);
