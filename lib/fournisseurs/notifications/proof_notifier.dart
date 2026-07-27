import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_proof_list.dart';
import '../repositories/proof_repository.dart';

// Provider du repository (à adapter selon la configuration de ton projet)
final proofRepositoryProvider = Provider<ProofRepository>((ref) {
  throw UnimplementedError('Initialisez votre ProofRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class ProofNotifier extends Notifier<AsyncValue<PaginatedProofList>> {
  late final ProofRepository _repository;
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedProofList> build() {
    _repository = ref.watch(proofRepositoryProvider);
    loadProofs();
    return const AsyncLoading();
  }

  Future<void> loadProofs({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final proofs = await _repository.getProofs(page: page);
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
      await _repository.deleteProof(id);
      await loadProofs(page: _currentPage);
    } catch (e, st) {
      state = AsyncError(Exception('Erreur lors de la suppression de la preuve : $e'), st);
    }
  }
}

/// Provider pour Riverpod 3.x
final proofNotifierProvider = NotifierProvider<
    ProofNotifier, AsyncValue<PaginatedProofList>>(
  ProofNotifier.new,
);