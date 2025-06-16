// lib/fournisseurs/repositories/batch_repository.dart
import '../../models/batch.dart';
import '../../services/batch_service.dart';

class BatchRepository {
  final BatchService service;

  BatchRepository(this.service);

  Future<List<Batch>> fetchBatches() => service.getBatches();

  Future<Batch> createBatch(Batch batch) => service.createBatch(batch);

  Future<Batch> updateBatch(int id, Batch batch) =>
      service.updateBatch(id, batch);

  Future<void> deleteBatch(int id) => service.deleteBatch(id);
}
