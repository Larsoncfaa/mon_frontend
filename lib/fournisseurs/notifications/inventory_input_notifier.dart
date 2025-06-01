import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/inventory_input.dart';
import '../../services/inventory_input_service.dart';
import '../repositories/inventory_input_repository.dart';

/// Provider du repository
final inventoryInputRepositoryProvider = Provider<InventoryInputRepository>((ref) {
  // Ici, tu peux injecter Dio par un autre provider si nécessaire.
  // Exemple : final dio = ref.watch(dioProvider);
  // return InventoryInputRepository(InventoryInputService(dio));
  //
  // Pour l’instant on crée un Dio local, mais tu peux améliorer ça.
  final dio = Dio(BaseOptions(baseUrl: 'https://ton-api.com/api'));
  return InventoryInputRepository(InventoryInputService(dio));
});

/// Provider de StateNotifier qui gère l'état de la prédiction.
final inventoryPredictionNotifierProvider = StateNotifierProvider<
    InventoryPredictionNotifier, AsyncValue<Map<String, dynamic>>>(
      (ref) {
    final repository = ref.watch(inventoryInputRepositoryProvider);
    return InventoryPredictionNotifier(repository);
  },
);

/// Notifier qui exécute la prédiction et met à jour l'état.
class InventoryPredictionNotifier
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final InventoryInputRepository repository;

  InventoryPredictionNotifier(this.repository)
      : super(const AsyncValue.data({}));

  /// Appelle la prédiction et met à jour l'état.
  Future<void> predictInventory(InventoryInput input) async {
    state = const AsyncLoading();
    try {
      final result = await repository.predictInventory(input);
      state = AsyncValue.data(result as Map<String, dynamic>);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
