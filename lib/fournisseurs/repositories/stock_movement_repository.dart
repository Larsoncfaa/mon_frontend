// lib/fournisseurs/repositories/stock_movement_repository.dart

import 'package:flutter/foundation.dart';
import '../../models/stock_movement.dart';
import '../../pagination/paginated_stock_movement_list.dart';
import '../../services/stock_movement_service.dart';

/// Repository qui centralise les appels liés aux mouvements de stock
class StockMovementRepository {
  final StockMovementService service;

  StockMovementRepository(this.service);

  Future<PaginatedStockMovementList> fetchStockMovements({int page = 1}) async {
    debugPrint("🔄 [Repository] fetchStockMovements(page: $page) appelé");
    final paginated = await service.fetchStockMovements(page: page);
    // Affiche l’objet complet pour vérifier la désérialisation
    debugPrint("📦 [Repository] paginated (raw) = $paginated");
    // Affiche la liste ‘results’, même si vide ou null
    debugPrint("📦 [Repository] paginated.results = ${paginated.results}");
    return paginated;
  }

  Future<StockMovement> getStockMovement(int id) async {
    debugPrint("🔄 [Repository] getStockMovement(id: $id) appelé");
    final movement = await service.getStockMovement(id);
    debugPrint("📦 [Repository] StockMovement récupéré = $movement");
    return movement;
  }

  Future<StockMovement> createStockMovement(StockMovement movement) async {
    debugPrint("🔄 [Repository] createStockMovement(movement.id=${movement.id}) appelé");
    final created = await service.createStockMovement(movement);
    debugPrint("📦 [Repository] StockMovement créé = $created");
    return created;
  }

  Future<StockMovement> updateStockMovement(StockMovement movement) async {
    debugPrint("🔄 [Repository] updateStockMovement(movement.id=${movement.id}) appelé");
    final updated = await service.updateStockMovement(movement);
    debugPrint("📦 [Repository] StockMovement mis à jour = $updated");
    return updated;
  }

  Future<void> deleteStockMovement(int id) async {
    debugPrint("🔄 [Repository] deleteStockMovement(id: $id) appelé");
    await service.deleteStockMovement(id);
    debugPrint("✅ [Repository] StockMovement supprimé (id: $id)");
  }
  Future<StockMovement> archiveStockMovement(int id) {
    return service.archiveStockMovement(id);
  }
  Future<StockMovement> restoreStockMovement(int id) {
    return service.restoreStockMovement(id);
  }
  Future<StockMovement> applyStockMovement(int id) async {
    debugPrint("🔄 [Repository] applyStockMovement(id: $id) appelé");
    final applied = await service.applyStockMovement(id);
    debugPrint("✅ [Repository] StockMovement appliqué = $applied");
    return applied;
  }
}
