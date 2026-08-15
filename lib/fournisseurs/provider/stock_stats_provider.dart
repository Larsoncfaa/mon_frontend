import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_overview.dart';
import '../../models/stock_stats.dart';
import '../../services/stock_stats_service.dart';
import '../repositories/stock_stats_repository.dart';

/// 1. Service Provider
final stockStatsServiceProvider = Provider<StockStatsService>((ref) {
  return StockStatsService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final stockStatsRepositoryProvider = Provider<StockStatsRepository>((ref) {
  return StockStatsRepository(ref.watch(stockStatsServiceProvider));
});

/// Notifier moderne pour StockOverview (Riverpod 3.x)
class StockOverviewNotifier extends Notifier<AsyncValue<StockOverview>> {
  @override
  AsyncValue<StockOverview> build() {
    Future.microtask(() => loadOverview());
    return const AsyncLoading();
  }

  Future<void> loadOverview() async {
    try {
      final repository = ref.read(stockStatsRepositoryProvider);
      final data = await repository.fetchOverview();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider pour StockOverview
final stockOverviewNotifierProvider = NotifierProvider<
    StockOverviewNotifier, AsyncValue<StockOverview>>(
  StockOverviewNotifier.new,
);

/// Notifier moderne pour StockStats (Riverpod 3.x)
class StockStatsNotifier extends Notifier<AsyncValue<StockStats>> {
  @override
  AsyncValue<StockStats> build() {
    Future.microtask(() => loadStats());
    return const AsyncLoading();
  }

  Future<void> loadStats() async {
    try {
      final repository = ref.read(stockStatsRepositoryProvider);
      final data = await repository.fetchStats();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 4. Notifier Provider pour StockStats
final stockStatsNotifierProvider = NotifierProvider<
    StockStatsNotifier, AsyncValue<StockStats>>(
  StockStatsNotifier.new,
);
