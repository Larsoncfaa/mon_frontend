// lib/fournisseurs/notifications/stock_movement_notifier.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/stock_movement.dart';
import '../../pagination/paginated_stock_movement_list.dart';
import '../repositories/stock_movement_repository.dart';

/// Notifier pour gérer la logique d'affichage et d'interaction avec les mouvements de stock
class StockMovementNotifier extends StateNotifier<AsyncValue<PaginatedStockMovementList>> {
  final StockMovementRepository repository;

  StockMovementNotifier(this.repository) : super(const AsyncLoading()) {
    fetchStockMovements();
  }

  /// Récupère les mouvements de stock (page par défaut : 1)
  Future<void> fetchStockMovements({int page = 1}) async {
    debugPrint("🔄 [Notifier] fetchStockMovements(page: $page) démarré");
    state = const AsyncLoading();

    try {
      final paginated = await repository.fetchStockMovements(page: page);
      debugPrint("✅ [Notifier] paginated.results = ${paginated.results}");
      debugPrint("🔁 [Notifier] state mis en .data avec ${paginated.results.length} mouvements");
      state = AsyncData(paginated);
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant fetchStockMovements: $e");
      state = AsyncError(e, st);
    }
  }

  /// Supprime un mouvement et recharge la liste
  Future<void> deleteStockMovement(int id) async {
    debugPrint("🔄 [Notifier] deleteStockMovement(id: $id) démarré");
    try {
      await repository.deleteStockMovement(id);
      debugPrint("✅ [Notifier] deleteStockMovement(id: $id) réussi, rechargement...");
      await fetchStockMovements();
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant deleteStockMovement: $e");
      state = AsyncError(e, st);
    }
  }
  /// Met à jour un mouvement et recharge
  Future<void> updateStockMovement(StockMovement mvt) async {
    debugPrint("🔄 [Notifier] updateStockMovement(id: ${mvt.id}) démarré");
    try {
      await repository.updateStockMovement(mvt);
      debugPrint("✅ [Notifier] updateStockMovement réussi, rechargement...");
      await fetchStockMovements();
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant updateStockMovement: $e");
      state = AsyncError(e, st);
    }
  }Future<void> archiveStockMovement(int id) async {
    debugPrint("🔄 [Notifier] archiveStockMovement(id: $id) démarré");
    try {
      final updated = await repository.archiveStockMovement(id);
      debugPrint("✅ [Notifier] archive réussi : $updated");

      state = state.whenData((paginated) {
        final updatedList = paginated.results.map((mvt) {
          return mvt.id == id ? updated : mvt;
        }).toList();

        return paginated.copyWith(results: updatedList);
      });
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur archive : $e");
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<void> restoreStockMovement(int id) async {
    debugPrint("🔄 [Notifier] restoreStockMovement(id: $id) démarré");
    try {
      final updated = await repository.restoreStockMovement(id);
      debugPrint("✅ [Notifier] restore réussi : $updated");

      state = state.whenData((paginated) {
        final updatedList = paginated.results.map((mvt) {
          return mvt.id == id ? updated : mvt;
        }).toList();

        return paginated.copyWith(results: updatedList);
      });
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur restore : $e");
      state = AsyncError(e, st);
      rethrow;
    }
  }
  Future<void> applyStockMovement(int id) async {
    debugPrint("🔄 [Notifier] applyStockMovement(id: $id) démarré");
    try {
      final updated = await repository.applyStockMovement(id);
      debugPrint("✅ [Notifier] apply réussi : $updated");

      state = state.whenData((paginated) {
        final updatedList = paginated.results.map((mvt) {
          return mvt.id == id ? updated : mvt;
        }).toList();

        return paginated.copyWith(results: updatedList);
      });
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur apply : $e");
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

