import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/inventory_input.dart';
import '../../services/inventory_input_service.dart';
import '../repositories/inventory_input_repository.dart';

/// Provider du repository
final inventoryInputRepositoryProvider = Provider<InventoryInputRepository>((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://ton-api.com/api'));
  return InventoryInputRepository(InventoryInputService(dio));
});

/// Notifier qui exécute la prédiction et met à jour l'état (Riverpod 3.x).
class InventoryPredictionNotifier
    extends Notifier<AsyncValue<Map<String, dynamic>>> {
  late final InventoryInputRepository _repository;

  @override
  AsyncValue<Map<String, dynamic>> build() {
    _repository = ref.watch(inventoryInputRepositoryProvider);
    return const AsyncValue.data({});
  }

  /// Appelle la prédiction et met à jour l'état.
  Future<void> predictInventory(InventoryInput input) async {
    state = const AsyncLoading();
    try {
      final result = await _repository.predictInventory(input);
      state = AsyncValue.data(result as Map<String, dynamic>);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final inventoryPredictionNotifierProvider = NotifierProvider<
    InventoryPredictionNotifier, AsyncValue<Map<String, dynamic>>>(
  InventoryPredictionNotifier.new,
);