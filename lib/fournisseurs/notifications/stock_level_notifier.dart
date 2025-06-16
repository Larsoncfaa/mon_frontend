import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/stock_level.dart';
import '../../pagination/paginated_stock_level.dart';
import '../repositories/stock_level_repository.dart';


/// Notifier qui gère la logique de chargement et de mise à jour des niveaux de stock
class StockLevelNotifier extends StateNotifier<AsyncValue<PaginatedStockLevel>> {
  final StockLevelRepository repository;

  StockLevelNotifier(this.repository) : super(const AsyncLoading()) {
    fetchStockLevels();
  }

  /// Charge les niveaux de stock depuis le backend
  Future<void> fetchStockLevels({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final stockLevels = await repository.fetchStockLevels(page: page);
      state = AsyncData(stockLevels);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Supprime un niveau de stock puis recharge la liste
  Future<void> deleteStockLevel(int id) async {
    try {
      await repository.deleteStockLevel(id);
      await fetchStockLevels();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Création d’un nouveau niveau de stock, puis recharge la liste
  Future<void> createLevel(StockLevel newLevel) async {
    try {
      await repository.createStockLevel(newLevel);
      await fetchStockLevels();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}


