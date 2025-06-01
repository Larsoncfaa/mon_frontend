import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../models/stock_movement.dart';
import '../pagination/paginated_stock_movement_list.dart';

/// Service API pour la gestion des mouvements de stock
class StockMovementService {
  final Dio dio;

  StockMovementService(this.dio);

  /// Récupère une page de mouvements de stock
  Future<PaginatedStockMovementList> fetchStockMovements({int page = 1}) async {
    final response = await dio.get('/v1/stock-movements/', queryParameters: {'page': page});
    return PaginatedStockMovementList.fromJson(response.data);
  }

  /// Récupère un mouvement de stock par son ID
  Future<StockMovement> getStockMovement(int id) async {
    final response = await dio.get('/v1/stock-movements/$id/');
    return StockMovement.fromJson(response.data);
  }

  /// Crée un nouveau mouvement de stock
  Future<StockMovement> createStockMovement(StockMovement movement) async {
    final data = movement.toJson()..remove('id');
    final response = await dio.post('/v1/stock-movements/', data: data);
    return StockMovement.fromJson(response.data);
  }

  /// Met à jour un mouvement de stock existant
  Future<StockMovement> updateStockMovement(StockMovement movement) async {
    final response = await dio.put('/v1/stock-movements/${movement.id}/', data: movement.toJson());
    return StockMovement.fromJson(response.data);
  }

  /// Supprime un mouvement de stock par son ID
  Future<void> deleteStockMovement(int id) async {
    await dio.delete('/v1/stock-movements/$id/');
  }

  when({required Column Function(dynamic movements) data, required Center Function() loading, required Text Function(dynamic err, dynamic _)   error}) {}
}
