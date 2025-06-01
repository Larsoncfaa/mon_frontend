import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/sales_input.dart';
import '../repositories/sales_input_repository.dart';

/// Notifier pour gérer l’état de la requête de prédiction.
class SalesInputNotifier extends StateNotifier<AsyncValue<void>> {
  final SalesInputRepository repository;

  SalesInputNotifier(this.repository) : super(const AsyncData(null));

  /// Appelle l’API pour prédire les ventes avec les données fournies.
  Future<void> submitSalesInput(SalesInput input) async {
    state = const AsyncLoading();
    try {
      await repository.predictSales(input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
