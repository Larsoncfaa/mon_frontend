import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/batch.dart';
import '../repositories/batch_repository.dart';

class BatchNotifier extends StateNotifier<AsyncValue<List<Batch>>> {
  final BatchRepository repository;

  BatchNotifier(this.repository) : super(const AsyncValue.loading()) {
    loadBatches();
  }

  /// Charge les lots depuis l’API
  Future<void> loadBatches() async {
    try {
      final batches = await repository.fetchBatches();
      state = AsyncValue.data(batches);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Rafraîchit les données (utile pour pull-to-refresh)
  Future<void> refresh() => loadBatches();



  Future<void> createBatch(Batch newBatch) async {
    try {
      final created = await repository.createBatch(newBatch);
      final previous = state.value ?? [];
      state = AsyncValue.data([...previous, created]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  } Future<void> updateBatch(int id, Batch updatedBatch) async {
    try {
      final updated = await repository.updateBatch(id, updatedBatch);
      state = AsyncValue.data([ updated]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteBatch(int id) async {
    try {
      await repository.deleteBatch(id);
      final updatedList = (state.value ?? []).where((b) => b.id != id).toList();
      state = AsyncValue.data(updatedList);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

}
