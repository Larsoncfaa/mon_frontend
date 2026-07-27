import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/stock_level.dart';
import '../../pagination/paginated_stock_level.dart';
import '../repositories/stock_level_repository.dart';

// Provider du repository (à adapter selon ton projet)
final stockLevelRepositoryProvider = Provider<StockLevelRepository>((ref) {
  throw UnimplementedError('Initialisez votre StockLevelRepository ici');
});

/// Notifier qui gère la logique de chargement et de mise à jour des niveaux de stock (Riverpod 3.x)
class StockLevelNotifier extends Notifier<AsyncValue<PaginatedStockLevel>> {
  late final StockLevelRepository _repository;

  @override
  AsyncValue<PaginatedStockLevel> build() {
    _repository = ref.watch(stockLevelRepositoryProvider);
    fetchStockLevels();
    return const AsyncLoading();
  }

  /// Charge les niveaux de stock depuis le backend
  Future<void> fetchStockLevels({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final stockLevels = await _repository.fetchStockLevels(page: page);
      state = AsyncData(stockLevels);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Supprime un niveau de stock puis recharge la liste
  Future<void> deleteStockLevel(int id) async {
    try {
      await _repository.deleteStockLevel(id);
      await fetchStockLevels();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Création d’un nouveau niveau de stock, puis recharge la liste
  Future<void> createLevel(StockLevel newLevel) async {
    try {
      await _repository.createStockLevel(newLevel);
      await fetchStockLevels();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final stockLevelNotifierProvider = NotifierProvider<
    StockLevelNotifier, AsyncValue<PaginatedStockLevel>>(
  StockLevelNotifier.new,
);