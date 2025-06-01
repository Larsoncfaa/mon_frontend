
import '../../models/warehouse.dart';
import '../../pagination/paginated_warehouse_list.dart';
import '../../services/warehouse_service.dart';

/// Repository pour centraliser l'accès aux données des entrepôts
class WarehouseRepository {
  final WarehouseService service;

  WarehouseRepository(this.service);

  Future<PaginatedWarehouseList> fetchWarehouses({int page = 1}) {
    return service.fetchWarehouses(page: page);
  }

  Future<Warehouse> getWarehouse(int id) {
    return service.getWarehouse(id);
  }

  Future<Warehouse> createWarehouse(Warehouse warehouse) {
    return service.createWarehouse(warehouse);
  }

  Future<Warehouse> updateWarehouse(Warehouse warehouse) {
    return service.updateWarehouse(warehouse);
  }

  Future<void> deleteWarehouse(int id) {
    return service.deleteWarehouse(id);
  }
}
