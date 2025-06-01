import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';



import '../../core/network/dio_provider.dart';
import '../../models/batch.dart';
import '../../services/batch_service.dart';
import '../notifications/batch_notifier.dart';
import '../repositories/batch_repository.dart';




/// Fournisseur du service
final batchServiceProvider = Provider<BatchService>((ref) {
  return BatchService(ref.watch(dioProvider));
});

/// Fournisseur du repository
final batchRepositoryProvider = Provider<BatchRepository>((ref) {
  return BatchRepository(ref.watch(batchServiceProvider as ProviderListenable<Dio>));
});

/// Fournisseur du notifier
final batchNotifierProvider = StateNotifierProvider<BatchNotifier, AsyncValue<List<Batch>>>((ref) {
  return BatchNotifier(ref.watch(batchRepositoryProvider));
});
