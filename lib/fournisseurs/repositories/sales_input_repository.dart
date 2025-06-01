

import '../../models/sales_input.dart';
import '../../services/sales_input_service.dart';

/// Repository pour encapsuler la logique liée à SalesInput.
class SalesInputRepository {
  final SalesInputService service;

  SalesInputRepository(this.service);

  /// Envoie les données pour prédire les ventes.
  Future<void> predictSales(SalesInput input) async {
    await service.sendSalesInput(input);
  }
}
