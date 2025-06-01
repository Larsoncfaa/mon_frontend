import 'package:dio/dio.dart';
import '../models/inventory_input.dart';

class InventoryInputService {
  final Dio dio;

  InventoryInputService(this.dio);

  /// Envoie une requête POST pour obtenir la prédiction de stock
  Future<Response> predictInventory(InventoryInput input) async {
    final response = await dio.post(
      'v1/predict/inventory/',
      data: input.toJson(),
    );
    return response;
  }
}
