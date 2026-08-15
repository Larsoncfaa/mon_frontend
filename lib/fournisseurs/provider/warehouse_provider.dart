import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/warehouse.dart';
import '../../pagination/paginated_warehouse_list.dart';
import '../../services/warehouse_service.dart';
import '../repositories/warehouse_repository.dart';

/// 1. Service Provider
final warehouseServiceProvider = Provider<WarehouseService>((ref) {
  return WarehouseService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final warehouseRepositoryProvider = Provider<WarehouseRepository>((ref) {
  return WarehouseRepository(ref.watch(warehouseServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class WarehouseNotifier extends Notifier<AsyncValue<PaginatedWarehouseList>> {
  @override
  AsyncValue<PaginatedWarehouseList> build() {
    Future.microtask(() => fetchWarehouses());
    return const AsyncLoading();
  }

  Future<void> fetchWarehouses({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(warehouseRepositoryProvider);
      final result = await repository.fetchWarehouses(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteWarehouse(int id) async {
    try {
      final repository = ref.read(warehouseRepositoryProvider);
      await repository.deleteWarehouse(id);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Crée un entrepôt
  Future<void> createWarehouse(String name, String location) async {
    try {
      final repository = ref.read(warehouseRepositoryProvider);
      final warehouse = Warehouse(id: 0, name: name, location: location);
      await repository.createWarehouse(warehouse);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Met à jour un entrepôt existant
  Future<void> updateWarehouse(int id, String name, String location) async {
    try {
      final repository = ref.read(warehouseRepositoryProvider);
      final updated = Warehouse(id: id, name: name, location: location);
      await repository.updateWarehouse(updated);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final warehouseNotifierProvider = NotifierProvider<
    WarehouseNotifier, AsyncValue<PaginatedWarehouseList>>(
  WarehouseNotifier.new,
);

/// 4. Fournisseur d’un entrepôt par ID
final warehouseByIdProvider =
FutureProvider.family<Warehouse, int>((ref, id) async {
  final repo = ref.watch(warehouseRepositoryProvider);
  return repo.getWarehouse(id);
});

/// 5. Fournisseur de la liste simple des entrepôts (non paginée)
final warehouseListProvider = FutureProvider<List<Warehouse>>((ref) async {
  final repo = ref.watch(warehouseRepositoryProvider);
  final result = await repo.fetchWarehouses();
  return result.results;
});
