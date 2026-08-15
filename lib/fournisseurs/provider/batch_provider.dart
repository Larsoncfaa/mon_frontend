import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/batch.dart';
import '../../services/batch_service.dart';
import '../repositories/batch_repository.dart';

/// 1. Service Provider
final batchServiceProvider = Provider<BatchService>((ref) {
  final dio = ref.watch(dioProvider);
  return BatchService(dio);
});

/// 2. Repository Provider
final batchRepositoryProvider = Provider<BatchRepository>((ref) {
  final service = ref.watch(batchServiceProvider);
  return BatchRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class BatchNotifier extends Notifier<AsyncValue<List<Batch>>> {
  @override
  AsyncValue<List<Batch>> build() {
    Future.microtask(() => loadBatches());
    return const AsyncValue.loading();
  }

  Future<void> loadBatches() async {
    debugPrint('BatchNotifier: loading batches...');
    try {
      final repository = ref.read(batchRepositoryProvider);
      final batches = await repository.fetchBatches();
      state = AsyncValue.data(batches);
    } catch (e, st) {
      debugPrint('BatchNotifier: error loading batches: $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() => loadBatches();

  Future<void> createBatch(Batch newBatch) async {
    try {
      final repository = ref.read(batchRepositoryProvider);
      final created = await repository.createBatch(newBatch);
      final previous = state.value ?? [];
      state = AsyncValue.data([...previous, created]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateBatch(int id, Batch updatedBatch) async {
    try {
      final repository = ref.read(batchRepositoryProvider);
      final updated = await repository.updateBatch(id, updatedBatch);
      final previous = state.value ?? [];
      final updatedList = previous.map((b) => b.id == id ? updated : b).toList();
      state = AsyncValue.data(updatedList);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteBatch(int id) async {
    try {
      final repository = ref.read(batchRepositoryProvider);
      await repository.deleteBatch(id);
      final updatedList = (state.value ?? []).where((b) => b.id != id).toList();
      state = AsyncValue.data(updatedList);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// 3. Notifier Provider (Riverpod 3.x)
final batchNotifierProvider =
NotifierProvider<BatchNotifier, AsyncValue<List<Batch>>>(
  BatchNotifier.new,
);

/// Alias pour compatibilité
final batchProvider = batchNotifierProvider;

/// 4. Fournisseur pour récupérer un lot spécifique par son ID
final selectedBatchProvider =
FutureProvider.family<Batch, int>((ref, id) async {
  final repository = ref.watch(batchRepositoryProvider);
  return repository.getBatch(id);
});
