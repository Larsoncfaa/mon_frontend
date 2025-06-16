import 'package:dio/dio.dart';
import '../models/proof.dart';
import '../pagination/paginated_proof_list.dart';

class ProofService {
  final Dio _dio;

  ProofService(this._dio);

  Future<PaginatedProofList> fetchProofs({int page = 1}) async {
    try {
      final response = await _dio.get('/proofs/', queryParameters: {'page': page});
      return PaginatedProofList.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors du chargement des preuves : ${e.message}');
    }
  }

  Future<Proof> getProof(int id) async {
    try {
      final response = await _dio.get('/proofs/$id/');
      return Proof.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors de la récupération de la preuve $id : ${e.message}');
    }
  }

  Future<Proof> createProof(Proof proof) async {
    try {
      final response = await _dio.post('/proofs/', data: proof.toJson());
      return Proof.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors de la création d\'une preuve : ${e.message}');
    }
  }

  Future<Proof> updateProof(int id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put('/proofs/$id/', data: data);
      return Proof.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors de la mise à jour de la preuve $id : ${e.message}');
    }
  }

  Future<void> deleteProof(int id) async {
    try {
      await _dio.delete('/proofs/$id/');
    } on DioException catch (e) {
      throw Exception('Erreur lors de la suppression de la preuve $id : ${e.message}');
    }
  }
}
