import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/sales_input.dart';
import '../repositories/sales_input_repository.dart';

// Provider du repository (à adapter selon votre projet)
final salesInputRepositoryProvider = Provider<SalesInputRepository>((ref) {
  throw UnimplementedError('Initialisez votre SalesInputRepository ici');
});

/// Notifier pour gérer l’état de la requête de prédiction (Riverpod 3.x).
class SalesInputNotifier extends Notifier<AsyncValue<void>> {
  late final SalesInputRepository _repository;

  @override
  AsyncValue<void> build() {
    _repository = ref.watch(salesInputRepositoryProvider);
    return const AsyncData(null);
  }

  /// Appelle l’API pour prédire les ventes avec les données fournies.
  Future<void> submitSalesInput(SalesInput input) async {
    state = const AsyncLoading();
    try {
      await _repository.predictSales(input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final salesInputNotifierProvider =
NotifierProvider<SalesInputNotifier, AsyncValue<void>>(
  SalesInputNotifier.new,
);