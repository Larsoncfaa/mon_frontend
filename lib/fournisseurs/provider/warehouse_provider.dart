import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/warehouse.dart';
import '../../pagination/paginated_warehouse_list.dart';
import '../../services/warehouse_service.dart';
import '../notifications/warehouse_notifier.dart';
import '../repositories/warehouse_repository.dart';




/// Fournisseur du service d'entrepôts
final warehouseServiceProvider = Provider<WarehouseService>((ref) {
  final dio = ref.watch(dioProvider);
  return WarehouseService(dio);
});

/// Fournisseur du repository d'entrepôts
final warehouseRepositoryProvider = Provider<WarehouseRepository>((ref) {
  final service = ref.watch(warehouseServiceProvider);
  return WarehouseRepository(service);
});

/// Fournisseur du notifier d'entrepôts
final warehouseNotifierProvider = StateNotifierProvider<WarehouseNotifier, AsyncValue<PaginatedWarehouseList>>((ref) {
  final repository = ref.watch(warehouseRepositoryProvider);
  return WarehouseNotifier(repository);
});

/// Fournisseur d’un entrepôt par ID
final warehouseByIdProvider = FutureProvider.family<Warehouse, int>((ref, id) async {
  final repo = ref.watch(warehouseRepositoryProvider);
  return repo.getWarehouse(id);
});
