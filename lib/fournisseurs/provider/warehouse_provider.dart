import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/warehouse.dart';
import '../../pagination/paginated_warehouse_list.dart';
import '../../services/warehouse_service.dart';
import '../notifications/warehouse_notifier.dart';
import '../repositories/warehouse_repository.dart';

/// 1. Fournisseur du service d'entrepôts
final warehouseServiceProvider = Provider<WarehouseService>((ref) {
  final dio = ref.watch(dioProvider);
  return WarehouseService(dio);
});

/// 2. Fournisseur du repository d'entrepôts
final warehouseRepositoryProvider = Provider<WarehouseRepository>((ref) {
  final service = ref.watch(warehouseServiceProvider);
  return WarehouseRepository(service);
});

/// 3. Fournisseur du notifier d'entrepôts (Riverpod 3.x)
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