import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../services/inventory_input_service.dart';
import '../repositories/inventory_input_repository.dart';



final inventoryInputServiceProvider = Provider<InventoryInputService>((ref) {
  final dio = ref.watch(dioProvider);
  return InventoryInputService(dio);
});

final inventoryInputRepositoryProvider =
Provider<InventoryInputRepository>((ref) {
  final service = ref.watch(inventoryInputServiceProvider);
  return InventoryInputRepository(service);
});
