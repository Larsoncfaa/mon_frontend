

import '../../models/stock_alert.dart';
import '../../pagination/paginated_stock_alert_list.dart';
import '../../services/stock_alert_service.dart';

class StockAlertRepository {
  final StockAlertService service;

  StockAlertRepository(this.service);

  Future<PaginatedStockAlertList> fetchStockAlerts({int page = 1}) {
    return service.fetchStockAlerts(page: page);
  }

  Future<StockAlert> getStockAlert(int id) {
    return service.getStockAlert(id);
  }

  Future<StockAlert> createStockAlert(StockAlert alert) {
    return service.createStockAlert(alert);
  }

  Future<StockAlert> updateStockAlert(StockAlert alert) {
    return service.updateStockAlert(alert);
  }

  Future<void> deleteStockAlert(int id) {
    return service.deleteStockAlert(id);
  }
}
