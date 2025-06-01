

import '../../models/proof.dart';
import '../../pagination/paginated_proof_list.dart';
import '../../services/proof_service.dart';

class ProofRepository {
  final ProofService _service;

  ProofRepository(this._service);

  Future<PaginatedProofList> getProofs({int page = 1}) {
    return _service.fetchProofs(page: page);
  }

  Future<Proof> getProof(int id) {
    return _service.getProof(id);
  }

  Future<Proof> createProof(Proof proof) {
    return _service.createProof(proof);
  }

  Future<Proof> updateProof(int id, Map<String, dynamic> data) {
    return _service.updateProof(id, data);
  }

  Future<void> deleteProof(int id) {
    return _service.deleteProof(id);
  }
}
