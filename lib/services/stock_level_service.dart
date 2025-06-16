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
    try {
      final response = await dio.get('/stock-levels/', queryParameters: {'page': page});
      return PaginatedStockLevel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Erreur fetchStockLevels: ${e.response?.data}');
      rethrow;
    }
  }

  /// Récupère un niveau de stock par son ID
  Future<StockLevel> getStockLevel(int id) async {
    try {
      final response = await dio.get('/stock-levels/$id/');
      return StockLevel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Erreur getStockLevel: ${e.response?.data}');
      rethrow;
    }
  }

  /// Crée un nouveau niveau de stock
  Future<StockLevel> createStockLevel(StockLevel stockLevel) async {
    try {
      final data = stockLevel.toJson()..remove('id');
      final response = await dio.post('/stock-levels/', data: data);
      return StockLevel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Erreur createStockLevel: ${e.response?.data}');
      rethrow;
    }
  }

  /// Met à jour un niveau de stock existant
  Future<StockLevel> updateStockLevel(StockLevel stockLevel) async {
    try {
      final response = await dio.put('/stock-levels/${stockLevel.id}/', data: stockLevel.toJson());
      return StockLevel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Erreur updateStockLevel: ${e.response?.data}');
      rethrow;
    }
  }

  /// Supprime un niveau de stock par son ID
  Future<void> deleteStockLevel(int id) async {
    try {
      await dio.delete('/stock-levels/$id/');
    } on DioException catch (e) {
      debugPrint('Erreur deleteStockLevel: ${e.response?.data}');
      rethrow;
    }
  }

  // Cette méthode n'est pas utilisée ici mais semble être une coquille
  when({
    required Column Function(dynamic levels) data,
    required Center Function() loading,
    required Text Function(dynamic err, dynamic _) error,
  }) {}
}
