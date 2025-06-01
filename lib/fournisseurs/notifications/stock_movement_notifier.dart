import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    state = const AsyncLoading();
    try {
      final movements = await repository.fetchStockMovements(page: page);
      state = AsyncData(movements);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Supprime un mouvement et recharge la liste
  Future<void> deleteStockMovement(int id) async {
    try {
      await repository.deleteStockMovement(id);
      await fetchStockMovements();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
