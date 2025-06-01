import 'package:dio/dio.dart';
import '../models/sales_input.dart';

/// Service pour effectuer les requêtes HTTP liées à SalesInput.
class SalesInputService {
  final Dio dio;

  SalesInputService(this.dio);

  /// Envoie une requête POST pour générer une prédiction des ventes.
  Future<void> sendSalesInput(SalesInput input) async {
    await dio.post('/v1/ai/predict-sales/', data: input.toJson());
  }
}
