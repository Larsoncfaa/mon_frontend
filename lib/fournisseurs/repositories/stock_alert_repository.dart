// lib/fournisseurs/repositories/stock_alert_repository.dart

import 'package:flutter/foundation.dart';
import '../../models/stock_alert.dart';
import '../../pagination/paginated_stock_alert_list.dart';
import '../../services/stock_alert_service.dart';

class StockAlertRepository {
  final StockAlertService service;

  StockAlertRepository(this.service);

  Future<PaginatedStockAlertList> fetchStockAlerts({int page = 1}) async {
    debugPrint("🔄 [Repository] fetchStockAlerts(page: $page) appelé");
    final paginated = await service.fetchStockAlerts(page: page);
    // Affiche l’objet complet pour vérifier la désérialisation
    debugPrint("📦 [Repository] paginated (raw) = $paginated");
    // Affiche la liste ‘results’, même si vide ou null
    debugPrint("📦 [Repository] paginated.results = ${paginated.results}");
    return paginated;
  }

  Future<StockAlert> getStockAlert(int id) async {
    debugPrint("🔄 [Repository] getStockAlert(id: $id) appelé");
    final alert = await service.getStockAlert(id);
    debugPrint("📦 [Repository] StockAlert récupéré = $alert");
    return alert;
  }

  Future<StockAlert> createStockAlert(StockAlert alert) async {
    debugPrint("🔄 [Repository] createStockAlert(alert.id=${alert.id}) appelé");
    final created = await service.createStockAlert(alert);
    debugPrint("📦 [Repository] StockAlert créé = $created");
    return created;
  }

  Future<StockAlert> updateStockAlert(StockAlert alert) async {
    debugPrint("🔄 [Repository] updateStockAlert(alert.id=${alert.id}) appelé");
    final updated = await service.updateStockAlert(alert);
    debugPrint("📦 [Repository] StockAlert mis à jour = $updated");
    return updated;
  }

  Future<void> deleteStockAlert(int id) async {
    debugPrint("🔄 [Repository] deleteStockAlert(id: $id) appelé");
    await service.deleteStockAlert(id);
    debugPrint("✅ [Repository] StockAlert supprimé (id: $id)");
  }
}
