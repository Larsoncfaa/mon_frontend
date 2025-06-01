

import '../../models/stock_movement.dart';
import '../../pagination/paginated_stock_movement_list.dart';
import '../../services/stock_movement_service.dart';

/// Repository qui centralise les appels liés aux mouvements de stock
class StockMovementRepository {
  final StockMovementService service;

  StockMovementRepository(this.service);

  Future<PaginatedStockMovementList> fetchStockMovements({int page = 1}) {
    return service.fetchStockMovements(page: page);
  }

  Future<StockMovement> getStockMovement(int id) {
    return service.getStockMovement(id);
  }

  Future<StockMovement> createStockMovement(StockMovement movement) {
    return service.createStockMovement(movement);
  }

  Future<StockMovement> updateStockMovement(StockMovement movement) {
    return service.updateStockMovement(movement);
  }

  Future<void> deleteStockMovement(int id) {
    return service.deleteStockMovement(id);
  }
}
