import 'package:dio/dio.dart';


import '../../models/inventory_input.dart';
import '../../services/inventory_input_service.dart';


/// Repository pour interagir avec le service de prédiction de stock.
class InventoryInputRepository {
  final InventoryInputService service;

  InventoryInputRepository(this.service);

  /// Méthode publique pour prédire le stock.
  Future<Response> predictInventory(InventoryInput input) {
    return service.predictInventory(input);
  }
}
