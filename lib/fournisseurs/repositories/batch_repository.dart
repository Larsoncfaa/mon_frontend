import 'package:dio/dio.dart';
import '../../models/batch.dart';

class BatchRepository {
  final Dio dio;

  BatchRepository(this.dio);

  Future<List<Batch>> fetchBatches() async {
    final response = await dio.get('/batches/');
    final List data = response.data['results'];
    return data.map((e) => Batch.fromJson(e)).toList();
  }

  Future<Batch> createBatch(Batch batch) async {
    final response = await dio.post('/batches/', data: batch.toJson());
    return Batch.fromJson(response.data);
  }

  Future<Batch> updateBatch(int id, Batch batch) async {
    final response = await dio.put('/batches/$id/', data: batch.toJson());
    return Batch.fromJson(response.data);
  }

  Future<void> deleteBatch(int id) async {
    await dio.delete('/batches/$id/');
  }
}
