import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../services/sales_input_service.dart';
import '../notifications/sales_input_notifier.dart';
import '../repositories/sales_input_repository.dart';

/// Fournisseur de service.
final salesInputServiceProvider = Provider<SalesInputService>((ref) {
  final dio = ref.watch(dioProvider);
  return SalesInputService(dio);
});

/// Fournisseur de repository.
final salesInputRepositoryProvider = Provider<SalesInputRepository>((ref) {
  final service = ref.watch(salesInputServiceProvider);
  return SalesInputRepository(service);
});

/// Fournisseur de notifier.
final salesInputNotifierProvider =
StateNotifierProvider<SalesInputNotifier, AsyncValue<void>>((ref) {
  final repository = ref.watch(salesInputRepositoryProvider);
  return SalesInputNotifier(repository);
});
