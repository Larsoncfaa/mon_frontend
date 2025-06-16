import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/batch.dart';
import '../../services/batch_service.dart';
import '../notifications/batch_notifier.dart';
import '../repositories/batch_repository.dart';

/// Fournisseur du service Dio
final batchServiceProvider = Provider<BatchService>((ref) {
  final dio = ref.watch(dioProvider);
  return BatchService(dio);
});

/// Fournisseur du repository, dépend du service
final batchRepositoryProvider = Provider<BatchRepository>((ref) {
  final service = ref.watch(batchServiceProvider);
  return BatchRepository(service); // ✅ correction ici
});


/// Fournisseur du notifier (StateNotifier)
final batchNotifierProvider =
StateNotifierProvider<BatchNotifier, AsyncValue<List<Batch>>>((ref) {
  final repository = ref.watch(batchRepositoryProvider);
  return BatchNotifier(repository);
});
final selectedBatchProvider = FutureProvider.family<Batch, int>((ref, id) async {
  final service = ref.watch(batchServiceProvider);
  return service.getBatch(id);
});

final batchProvider = StateNotifierProvider<BatchNotifier, AsyncValue<List<Batch>>>(
      (ref) {
    final repository = ref.read(batchRepositoryProvider);
    return BatchNotifier(repository);
  },
);