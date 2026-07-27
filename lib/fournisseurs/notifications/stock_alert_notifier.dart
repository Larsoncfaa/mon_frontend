import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/stock_alert.dart';
import '../../pagination/paginated_stock_alert_list.dart';
import '../repositories/stock_alert_repository.dart';

// Provider du repository (à adapter selon ton projet)
final stockAlertRepositoryProvider = Provider<StockAlertRepository>((ref) {
  throw UnimplementedError('Initialisez votre StockAlertRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class StockAlertNotifier
    extends Notifier<AsyncValue<PaginatedStockAlertList>> {
  late final StockAlertRepository _repository;

  @override
  AsyncValue<PaginatedStockAlertList> build() {
    _repository = ref.watch(stockAlertRepositoryProvider);
    fetchStockAlerts();
    return const AsyncLoading();
  }

  Future<void> fetchStockAlerts({int page = 1}) async {
    debugPrint("🔄 [Notifier] fetchStockAlerts(page: $page) démarré");
    if (state is! AsyncData) {
      state = const AsyncLoading();
    }
    try {
      final paginated = await _repository.fetchStockAlerts(page: page);
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
      await _repository.deleteStockAlert(id);
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
      await _repository.createStockAlert(alert);
      debugPrint("✅ [Notifier] Alerte créée avec succès");
      await fetchStockAlerts();
    } catch (e, st) {
      debugPrint("🚨 [Notifier] Erreur pendant createAlert: $e");
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final stockAlertNotifierProvider = NotifierProvider<
    StockAlertNotifier, AsyncValue<PaginatedStockAlertList>>(
  StockAlertNotifier.new,
);