import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../models/stock_level.dart';
import '../pagination/paginated_stock_level.dart';


/// Service d'accès à l'API REST pour les niveaux de stock (`StockLevel`)
class StockLevelService {
  final Dio dio;

  StockLevelService(this.dio);

  /// Récupère une page de niveaux de stock
  Future<PaginatedStockLevel> fetchStockLevels({int page = 1}) async {
    final response = await dio.get('/v1/stock-levels/', queryParameters: {'page': page});
    return PaginatedStockLevel.fromJson(response.data);
  }

  /// Récupère un niveau de stock par son ID
  Future<StockLevel> getStockLevel(int id) async {
    final response = await dio.get('/v1/stock-levels/$id/');
    return StockLevel.fromJson(response.data);
  }

  /// Crée un nouveau niveau de stock
  Future<StockLevel> createStockLevel(StockLevel stockLevel) async {
    final data = stockLevel.toJson()..remove('id');
    final response = await dio.post('/v1/stock-levels/', data: data);
    return StockLevel.fromJson(response.data);
  }

  /// Met à jour un niveau de stock existant
  Future<StockLevel> updateStockLevel(StockLevel stockLevel) async {
    final response = await dio.put('/v1/stock-levels/${stockLevel.id}/', data: stockLevel.toJson());
    return StockLevel.fromJson(response.data);
  }

  /// Supprime un niveau de stock par son ID
  Future<void> deleteStockLevel(int id) async {
    await dio.delete('/v1/stock-levels/$id/');
  }

  when({required Column Function(dynamic levels) data, required Center Function() loading, required Text Function(dynamic err, dynamic _)  error}) {}
}
