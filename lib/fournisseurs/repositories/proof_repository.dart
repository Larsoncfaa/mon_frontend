import '../../models/proof.dart';
import '../../pagination/paginated_proof_list.dart';
import '../../services/proof_service.dart';

class ProofRepository {
  final ProofService _service;

  ProofRepository(this._service);

  Future<PaginatedProofList> getProofs({int page = 1}) async {
    try {
      return await _service.fetchProofs(page: page);
    } catch (e) {
      throw Exception('Erreur lors du chargement des preuves (page $page) : $e');
    }
  }

  Future<Proof> getProof(int id) async {
    try {
      return await _service.getProof(id);
    } catch (e) {
      throw Exception('Erreur lors de la récupération de la preuve $id : $e');
    }
  }

  Future<Proof> createProof(Proof proof) async {
    try {
      return await _service.createProof(proof);
    } catch (e) {
      throw Exception('Erreur lors de la création de la preuve : $e');
    }
  }

  Future<Proof> updateProof(int id, Map<String, dynamic> data) async {
    try {
      return await _service.updateProof(id, data);
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour de la preuve $id : $e');
    }
  }

  Future<void> deleteProof(int id) async {
    try {
      await _service.deleteProof(id);
    } catch (e) {
      throw Exception('Erreur lors de la suppression de la preuve $id : $e');
    }
  }
}
