// lib/fournisseurs/provider/batch_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../../models/batch.dart';
import '../repositories/batch_repository.dart';

// Déclaration du provider du repository (à adapter selon votre projet)
final batchRepositoryProvider = Provider<BatchRepository>((ref) {
  throw UnimplementedError('Initialisez votre BatchRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class BatchNotifier extends Notifier<AsyncValue<List<Batch>>> {
  late final BatchRepository _repository;

  @override
  AsyncValue<List<Batch>> build() {
    _repository = ref.watch(batchRepositoryProvider);
    loadBatches();
    return const AsyncValue.loading();
  }

  Future<void> loadBatches() async {
    debugPrint('BatchNotifier: loading batches...');
    try {
      final batches = await _repository.fetchBatches();
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
      final created = await _repository.createBatch(newBatch);
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
      final updated = await _repository.updateBatch(id, updatedBatch);
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
      await _repository.deleteBatch(id);
      final updatedList = (state.value ?? []).where((b) => b.id != id).toList();
      state = AsyncValue.data(updatedList);
      debugPrint('BatchNotifier: batch $id deleted.');
    } catch (e, st) {
      debugPrint('BatchNotifier: error deleting batch: $e');
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final batchNotifierProvider =
NotifierProvider<BatchNotifier, AsyncValue<List<Batch>>>(BatchNotifier.new);