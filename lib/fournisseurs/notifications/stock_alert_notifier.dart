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
    state = const AsyncLoading();
    try {
      final alerts = await repository.fetchStockAlerts(page: page);
      state = AsyncData(alerts);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteStockAlert(int id) async {
    try {
      await repository.deleteStockAlert(id);
      await fetchStockAlerts();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
