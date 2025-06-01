import 'package:dio/dio.dart';
import '../models/proof.dart';
import '../pagination/paginated_proof_list.dart';


class ProofService {
  final Dio _dio;

  ProofService(this._dio);

  Future<PaginatedProofList> fetchProofs({int page = 1}) async {
    final response = await _dio.get('/v1/proofs/', queryParameters: {'page': page});
    return PaginatedProofList.fromJson(response.data);
  }

  Future<Proof> getProof(int id) async {
    final response = await _dio.get('/v1/proofs/$id/');
    return Proof.fromJson(response.data);
  }

  Future<Proof> createProof(Proof proof) async {
    final response = await _dio.post('/v1/proofs/', data: proof.toJson());
    return Proof.fromJson(response.data);
  }

  Future<Proof> updateProof(int id, Map<String, dynamic> data) async {
    final response = await _dio.put('/v1/proofs/$id/', data: data);
    return Proof.fromJson(response.data);
  }

  Future<void> deleteProof(int id) async {
    await _dio.delete('/v1/proofs/$id/');
  }
}
