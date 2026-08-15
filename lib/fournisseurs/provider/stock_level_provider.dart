import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_level.dart';
import '../../pagination/paginated_stock_level.dart';
import '../../services/stock_level_service.dart';
import '../repositories/stock_level_repository.dart';

/// 1. Service Provider
final stockLevelServiceProvider = Provider<StockLevelService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockLevelService(dio);
});

/// 2. Repository Provider
final stockLevelRepositoryProvider = Provider<StockLevelRepository>((ref) {
  final service = ref.watch(stockLevelServiceProvider);
  return StockLevelRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class StockLevelNotifier extends Notifier<AsyncValue<PaginatedStockLevel>> {
  @override
  AsyncValue<PaginatedStockLevel> build() {
    Future.microtask(() => fetchStockLevels());
    return const AsyncValue.loading();
  }

  /// Charge les niveaux de stock depuis le backend
  Future<void> fetchStockLevels({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(stockLevelRepositoryProvider);
      final stockLevels = await repository.fetchStockLevels(page: page);
      state = AsyncData(stockLevels);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Supprime un niveau de stock puis recharge la liste
  Future<void> deleteStockLevel(int id) async {
    try {
      final repository = ref.read(stockLevelRepositoryProvider);
      await repository.deleteStockLevel(id);
      await fetchStockLevels();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Création d’un nouveau niveau de stock, puis recharge la liste
  Future<void> createLevel(StockLevel newLevel) async {
    try {
      final repository = ref.read(stockLevelRepositoryProvider);
      await repository.createStockLevel(newLevel);
      await fetchStockLevels();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final stockLevelNotifierProvider = NotifierProvider<
    StockLevelNotifier, AsyncValue<PaginatedStockLevel>>(
  StockLevelNotifier.new,
);
