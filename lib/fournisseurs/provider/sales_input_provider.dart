import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/sales_input.dart';
import '../../services/sales_input_service.dart';
import '../repositories/sales_input_repository.dart';

/// 1. Service Provider
final salesInputServiceProvider = Provider<SalesInputService>((ref) {
  return SalesInputService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final salesInputRepositoryProvider = Provider<SalesInputRepository>((ref) {
  return SalesInputRepository(ref.watch(salesInputServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class SalesInputNotifier extends Notifier<AsyncValue<void>> {

  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  /// Appelle l’API pour prédire les ventes avec les données fournies.
  Future<void> submitSalesInput(SalesInput input) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(salesInputRepositoryProvider);
      await repository.predictSales(input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final salesInputNotifierProvider =
NotifierProvider<SalesInputNotifier, AsyncValue<void>>(
  SalesInputNotifier.new,
);
