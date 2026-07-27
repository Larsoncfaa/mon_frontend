import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/warehouse.dart';
import '../../pagination/paginated_warehouse_list.dart';
import '../repositories/warehouse_repository.dart';

// Provider du repository (à adapter selon la configuration de ton projet)
final warehouseRepositoryProvider = Provider<WarehouseRepository>((ref) {
  throw UnimplementedError('Initialisez votre WarehouseRepository ici');
});

/// Notifier pour gérer l'état des entrepôts (lecture, suppression, rechargement)
class WarehouseNotifier extends Notifier<AsyncValue<PaginatedWarehouseList>> {
  late final WarehouseRepository _repository;

  @override
  AsyncValue<PaginatedWarehouseList> build() {
    _repository = ref.watch(warehouseRepositoryProvider);
    fetchWarehouses();
    return const AsyncLoading();
  }

  Future<void> fetchWarehouses({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await _repository.fetchWarehouses(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteWarehouse(int id) async {
    try {
      await _repository.deleteWarehouse(id);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Crée un entrepôt
  Future<void> createWarehouse(String name, String location) async {
    try {
      final warehouse = Warehouse(id: 0, name: name, location: location);
      await _repository.createWarehouse(warehouse);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Met à jour un entrepôt existant
  Future<void> updateWarehouse(int id, String name, String location) async {
    try {
      final updated = Warehouse(id: id, name: name, location: location);
      await _repository.updateWarehouse(updated);
      await fetchWarehouses();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final warehouseNotifierProvider = NotifierProvider<
    WarehouseNotifier, AsyncValue<PaginatedWarehouseList>>(
  WarehouseNotifier.new,
);