

import '../../models/stock_level.dart';
import '../../pagination/paginated_stock_level.dart';
import '../../services/stock_level_service.dart';

/// Repository qui encapsule les appels au service StockLevelService
class StockLevelRepository {
  final StockLevelService service;

  StockLevelRepository(this.service);

  Future<PaginatedStockLevel> fetchStockLevels({int page = 1}) {
    return service.fetchStockLevels(page: page);
  }

  Future<StockLevel> getStockLevel(int id) {
    return service.getStockLevel(id);
  }

  Future<StockLevel> createStockLevel(StockLevel stockLevel) {
    return service.createStockLevel(stockLevel);
  }

  Future<StockLevel> updateStockLevel(StockLevel stockLevel) {
    return service.updateStockLevel(stockLevel);
  }

  Future<void> deleteStockLevel(int id) {
    return service.deleteStockLevel(id);
  }
}
