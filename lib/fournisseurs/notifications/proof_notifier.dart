import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_proof_list.dart';
import '../repositories/proof_repository.dart';

class ProofNotifier extends StateNotifier<AsyncValue<PaginatedProofList>> {
  final ProofRepository _repository;

  ProofNotifier(this._repository) : super(const AsyncLoading()) {
    loadProofs();
  }

  int _currentPage = 1;

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
