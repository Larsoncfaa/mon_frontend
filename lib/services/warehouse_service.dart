import 'package:dio/dio.dart';
import '../models/warehouse.dart';
import '../pagination/paginated_warehouse_list.dart';

/// Service chargé des appels API relatifs aux entrepôts
class WarehouseService {
  final Dio dio;

  WarehouseService(this.dio);

  /// Récupère une liste paginée d'entrepôts, avec filtres optionnels
  Future<PaginatedWarehouseList> fetchWarehouses({
    int page = 1,
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await dio.get(
        '/warehouses/',
        queryParameters: {
          'page': page,
          ...?filters,
        },
      );
      return PaginatedWarehouseList.fromJson(response.data);
    } on DioException catch (e) {
      print("❌ [WarehouseService] GET /warehouses/ (page $page) => ${e.response?.statusCode} : ${e.response?.data}");
      rethrow;
    }
  }

  /// Récupère un entrepôt par son ID
  Future<Warehouse> getWarehouse(int id) async {
    try {
      final response = await dio.get('/warehouses/$id/');
      return Warehouse.fromJson(response.data);
    } on DioException catch (e) {
      print("❌ [WarehouseService] GET /warehouses/$id/ => ${e.response?.statusCode} : ${e.response?.data}");
      rethrow;
    }
  }

  /// Crée un nouvel entrepôt
  Future<Warehouse> createWarehouse(Warehouse warehouse) async {
    try {
      final data = warehouse.toJson()..remove('id'); // on ne doit pas envoyer l'ID
      final response = await dio.post('/warehouses/', data: data);
      return Warehouse.fromJson(response.data);
    } on DioException catch (e) {
      print("❌ [WarehouseService] POST /warehouses/ => ${e.response?.statusCode} : ${e.response?.data}");
      rethrow;
    }
  }

  /// Met à jour un entrepôt existant
  Future<Warehouse> updateWarehouse(Warehouse warehouse) async {
    try {
      final response = await dio.put('/warehouses/${warehouse.id}/', data: warehouse.toJson());
      return Warehouse.fromJson(response.data);
    } on DioException catch (e) {
      print("❌ [WarehouseService] PUT /warehouses/${warehouse.id}/ => ${e.response?.statusCode} : ${e.response?.data}");
      rethrow;
    }
  }

  /// Supprime un entrepôt
  Future<void> deleteWarehouse(int id) async {
    try {
      await dio.delete<void>('/warehouses/$id/');
    } on DioException catch (e) {
      print("❌ [WarehouseService] DELETE /warehouses/$id/ => ${e.response?.statusCode} : ${e.response?.data}");
      rethrow;
    }
  }
}
