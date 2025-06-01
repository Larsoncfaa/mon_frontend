import 'package:dio/dio.dart';
import '../models/batch.dart';

class BatchService {
  final Dio dio;

  BatchService(this.dio);

  /// Récupère tous les lots (batches)
  Future<List<Batch>> getBatches() async {
    final response = await dio.get('/v1/batches/');
    final data = response.data as List;
    return data.map((e) => Batch.fromJson(e)).toList();
  }

  /// Récupère un lot par son ID
  Future<Batch> getBatch(String id) async {
    final response = await dio.get('/v1/batches/$id/');
    return Batch.fromJson(response.data);
  }

  /// Crée un nouveau lot
  Future<Batch> createBatch(Batch batch) async {
    final response = await dio.post('/batches/', data: batch.toJson());
    return Batch.fromJson(response.data);
  }

  /// Met à jour un lot entièrement
  Future<Batch> updateBatch(String id, Batch batch) async {
    final response = await dio.put('/batches/$id/', data: batch.toJson());
    return Batch.fromJson(response.data);
  }

  /// Supprime un lot
  Future<void> deleteBatch(String id) async {
    await dio.delete('/batches/$id/');
  }
}
