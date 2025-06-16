import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/stock_alert.dart';
import '../../pagination/paginated_stock_alert_list.dart';
import '../repositories/stock_alert_repository.dart';

class StockAlertNotifier extends StateNotifier<AsyncValue<PaginatedStockAlertList>> {
  final StockAlertRepository repository;

  StockAlertNotifier(this.repository) : super(const AsyncLoading()) {
    fetchStockAlerts();
  }

  Future<void> fetchStockAlerts({int page = 1}) async {
    debugPrint("🔄 [Notifier] fetchStockAlerts(page: $page) démarré");
    if (state is! AsyncData) {
      state = const AsyncLoading();
    }
    try {
      final paginated = await repository.fetchStockAlerts(page: page);
      debugPrint("✅ [Notifier] paginated.results = ${paginated.results}");
      state = AsyncData(paginated);
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant fetchStockAlerts: $e");
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async => fetchStockAlerts();

  Future<void> deleteStockAlert(int id) async {
    debugPrint("🔄 [Notifier] deleteStockAlert(id: $id) démarré");
    try {
      await repository.deleteStockAlert(id);
      debugPrint("✅ [Notifier] deleteStockAlert(id: $id) réussi");
      await fetchStockAlerts();
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant deleteStockAlert: $e");
      state = AsyncError(e, st);
    }
  }

  Future<void> createAlert(StockAlert alert) async {
    debugPrint("🆕 [Notifier] createAlert(alert: $alert) démarré");
    try {
      await repository.createStockAlert(alert);
      debugPrint("✅ [Notifier] Alerte créée avec succès");
      await fetchStockAlerts();
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant createAlert: $e");
      state = AsyncError(e, st);
    }
  }
}
