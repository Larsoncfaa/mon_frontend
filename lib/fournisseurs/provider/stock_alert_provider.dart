import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_alert.dart';
import '../../pagination/paginated_stock_alert_list.dart';
import '../../services/stock_alert_service.dart';
import '../repositories/stock_alert_repository.dart';

/// 1. Service Provider
final stockAlertServiceProvider = Provider<StockAlertService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockAlertService(dio);
});

/// 2. Repository Provider
final stockAlertRepositoryProvider = Provider<StockAlertRepository>((ref) {
  final service = ref.watch(stockAlertServiceProvider);
  return StockAlertRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class StockAlertNotifier extends Notifier<AsyncValue<PaginatedStockAlertList>> {

  @override
  AsyncValue<PaginatedStockAlertList> build() {
    Future.microtask(() => fetchStockAlerts());
    return const AsyncLoading();
  }

  Future<void> fetchStockAlerts({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(stockAlertRepositoryProvider);
      final paginated = await repository.fetchStockAlerts(page: page);
      state = AsyncData(paginated);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchStockAlerts();
  }

  Future<void> deleteStockAlert(int id) async {
    try {
      final repository = ref.read(stockAlertRepositoryProvider);
      await repository.deleteStockAlert(id);
      await fetchStockAlerts();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> createAlert(StockAlert alert) async {
    try {
      final repository = ref.read(stockAlertRepositoryProvider);
      await repository.createStockAlert(alert);
      await fetchStockAlerts();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateAlert(StockAlert alert) async {
    try {
      final repository = ref.read(stockAlertRepositoryProvider);
      await repository.updateStockAlert(alert);
      await fetchStockAlerts();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final stockAlertNotifierProvider = NotifierProvider<
    StockAlertNotifier, AsyncValue<PaginatedStockAlertList>>(
  StockAlertNotifier.new,
);

/// 4. Provider pour récupérer une alerte de stock par son ID
final stockAlertByIdProvider =
FutureProvider.family<StockAlert, int>((ref, id) async {
  final repository = ref.watch(stockAlertRepositoryProvider);
  return repository.getStockAlert(id);
});
