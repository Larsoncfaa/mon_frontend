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
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await loadProofs(page: _currentPage);
  }
}
