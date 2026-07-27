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
  return BatchRepository(service);
});

/// Fournisseur du notifier (Riverpod 3.x)
final batchNotifierProvider =
NotifierProvider<BatchNotifier, AsyncValue<List<Batch>>>(
  BatchNotifier.new,
);

/// Alias pour compatibilité si 'batchProvider' est utilisé ailleurs dans le code
final batchProvider = batchNotifierProvider;

/// Fournisseur pour récupérer un lot spécifique par son ID
final selectedBatchProvider =
FutureProvider.family<Batch, int>((ref, id) async {
  final service = ref.watch(batchServiceProvider);
  return service.getBatch(id);
});