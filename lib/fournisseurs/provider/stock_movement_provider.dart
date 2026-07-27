import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_movement.dart';
import '../../pagination/paginated_stock_movement_list.dart';
import '../../services/stock_movement_service.dart';
import '../repositories/stock_movement_repository.dart';

/// 1. Fournisseur du service de mouvement de stock
final stockMovementServiceProvider = Provider<StockMovementService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockMovementService(dio);
});

/// 2. Fournisseur du repository de mouvement de stock
final stockMovementRepositoryProvider = Provider<StockMovementRepository>((ref) {
  final service = ref.watch(stockMovementServiceProvider);
  return StockMovementRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class StockMovementNotifier
    extends Notifier<AsyncValue<PaginatedStockMovementList>> {

  @override
  AsyncValue<PaginatedStockMovementList> build() {
    Future.microtask(() => fetchStockMovements());
    return const AsyncValue.loading();
  }

  /// Récupère les mouvements de stock (page par défaut : 1)
  Future<void> fetchStockMovements({int page = 1}) async {
    debugPrint("🔄 [Notifier] fetchStockMovements(page: $page) démarré");
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(stockMovementRepositoryProvider);
      final paginated = await repository.fetchStockMovements(page: page);
      state = AsyncValue.data(paginated);
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant fetchStockMovements: $e");
      state = AsyncValue.error(e, st);
    }
  }

  /// Supprime un mouvement et recharge la liste
  Future<void> deleteStockMovement(int id) async {
    try {
      final repository = ref.read(stockMovementRepositoryProvider);
      await repository.deleteStockMovement(id);
      await fetchStockMovements();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Met à jour un mouvement et recharge
  Future<void> updateStockMovement(StockMovement mvt) async {
    try {
      final repository = ref.read(stockMovementRepositoryProvider);
      await repository.updateStockMovement(mvt);
      await fetchStockMovements();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> archiveStockMovement(int id) async {
    try {
      final repository = ref.read(stockMovementRepositoryProvider);
      final updated = await repository.archiveStockMovement(id);

      state = state.whenData((paginated) {
        final updatedList = paginated.results.map((mvt) {
          return mvt.id == id ? updated : mvt;
        }).toList();

        return paginated.copyWith(results: updatedList);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> restoreStockMovement(int id) async {
    try {
      final repository = ref.read(stockMovementRepositoryProvider);
      final updated = await repository.restoreStockMovement(id);

      state = state.whenData((paginated) {
        final updatedList = paginated.results.map((mvt) {
          return mvt.id == id ? updated : mvt;
        }).toList();

        return paginated.copyWith(results: updatedList);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> applyStockMovement(int id) async {
    try {
      final repository = ref.read(stockMovementRepositoryProvider);
      final updated = await repository.applyStockMovement(id);

      state = state.whenData((paginated) {
        final updatedList = paginated.results.map((mvt) {
          return mvt.id == id ? updated : mvt;
        }).toList();

        return paginated.copyWith(results: updatedList);
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}

/// 3. Fournisseur principal de la liste paginée (Riverpod 3.x)
final stockMovementNotifierProvider = NotifierProvider<
    StockMovementNotifier, AsyncValue<PaginatedStockMovementList>>(
  StockMovementNotifier.new,
);

/// 4. Fournisseur individuel par ID
final stockMovementByIdProvider =
FutureProvider.family<StockMovement, int>((ref, id) async {
  final repository = ref.watch(stockMovementRepositoryProvider);
  return repository.getStockMovement(id);
});
