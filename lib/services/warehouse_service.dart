import 'package:dio/dio.dart';
import '../models/warehouse.dart';
import '../pagination/paginated_warehouse_list.dart';

/// Service chargé des appels API relatifs aux entrepôts
class WarehouseService {
  final Dio dio;

  WarehouseService(this.dio);

  /// Récupère une liste paginée d'entrepôts
  Future<PaginatedWarehouseList> fetchWarehouses({int page = 1}) async {
    final response = await dio.get('/v1/warehouses/', queryParameters: {'page': page});
    return PaginatedWarehouseList.fromJson(response.data);
  }

  /// Récupère un entrepôt par son ID
  Future<Warehouse> getWarehouse(int id) async {
    final response = await dio.get('/v1/warehouses/$id/');
    return Warehouse.fromJson(response.data);
  }

  /// Crée un nouvel entrepôt
  Future<Warehouse> createWarehouse(Warehouse warehouse) async {
    final data = warehouse.toJson()..remove('id');
    final response = await dio.post('/v1/warehouses/', data: data);
    return Warehouse.fromJson(response.data);
  }

  /// Met à jour un entrepôt
  Future<Warehouse> updateWarehouse(Warehouse warehouse) async {
    final response = await dio.put('/v1/warehouses/${warehouse.id}/', data: warehouse.toJson());
    return Warehouse.fromJson(response.data);
  }

  /// Supprime un entrepôt
  Future<void> deleteWarehouse(int id) async {
    await dio.delete('/v1/warehouses/$id/');
  }
}
