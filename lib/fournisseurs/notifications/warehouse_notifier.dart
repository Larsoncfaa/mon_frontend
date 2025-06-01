import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/warehouse.dart';
import '../../pagination/paginated_warehouse_list.dart';
import '../repositories/warehouse_repository.dart';


/// Notifier pour gérer l'état des entrepôts (lecture, suppression, rechargement)
class WarehouseNotifier extends StateNotifier<AsyncValue<PaginatedWarehouseList>> {
  final WarehouseRepository repository;

  WarehouseNotifier(this.repository) : super(const AsyncLoading()) {
    fetchWarehouses();
  }

  Future<void> fetchWarehouses({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchWarehouses(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteWarehouse(int id) async {
    try {
      await repository.deleteWarehouse(id);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Crée un entrepôt
  Future<void> createWarehouse(String name, String location) async {
    try {
      final warehouse = Warehouse(id: null, name: name, location: location);
      await repository.createWarehouse(warehouse);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Met à jour un entrepôt existant
  Future<void> updateWarehouse(int id, String name, String location) async {
    try {
      final updated = Warehouse(id: id, name: name, location: location);
      await repository.updateWarehouse(updated);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
