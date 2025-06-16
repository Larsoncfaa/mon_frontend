// lib/fournisseurs/provider/batch_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../../models/batch.dart';
import '../repositories/batch_repository.dart';

class BatchNotifier extends StateNotifier<AsyncValue<List<Batch>>> {
  final BatchRepository repository;

  BatchNotifier(this.repository) : super(const AsyncValue.loading()) {
    loadBatches();
  }

  Future<void> loadBatches() async {
    debugPrint('BatchNotifier: loading batches...');
    try {
      final batches = await repository.fetchBatches();
      debugPrint('BatchNotifier: ${batches.length} batches loaded.');
      state = AsyncValue.data(batches);
    } catch (e, st) {
      debugPrint('BatchNotifier: error loading batches: $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() => loadBatches();

  Future<void> createBatch(Batch newBatch) async {
    debugPrint('BatchNotifier: creating batch...');
    try {
      final created = await repository.createBatch(newBatch);
      final previous = state.value ?? [];
      state = AsyncValue.data([...previous, created]);
      debugPrint('BatchNotifier: batch created: ${created.id}');
    } catch (e, st) {
      debugPrint('BatchNotifier: error creating batch: $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateBatch(int id, Batch updatedBatch) async {
    debugPrint('BatchNotifier: updating batch $id...');
    try {
      final updated = await repository.updateBatch(id, updatedBatch);
      final previous = state.value ?? [];
      final updatedList = previous.map((b) => b.id == id ? updated : b).toList();
      state = AsyncValue.data(updatedList);
      debugPrint('BatchNotifier: batch $id updated.');
    } catch (e, st) {
      debugPrint('BatchNotifier: error updating batch: $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteBatch(int id) async {
    debugPrint('BatchNotifier: deleting batch $id...');
    try {
      await repository.deleteBatch(id);
      final updatedList = (state.value ?? []).where((b) => b.id != id).toList();
      state = AsyncValue.data(updatedList);
      debugPrint('BatchNotifier: batch $id deleted.');
    } catch (e, st) {
      debugPrint('BatchNotifier: error deleting batch: $e');
      state = AsyncValue.error(e, st);
    }
  }
}
