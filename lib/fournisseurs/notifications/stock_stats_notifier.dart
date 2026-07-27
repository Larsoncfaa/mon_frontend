import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/stock_overview.dart';
import '../../models/stock_stats.dart';
import '../repositories/stock_stats_repository.dart';

// Provider du repository (à adapter selon la configuration de ton projet)
final stockStatsRepositoryProvider = Provider<StockStatsRepository>((ref) {
  throw UnimplementedError('Initialisez votre StockStatsRepository ici');
});

// ==========================================
// StockOverview
// ==========================================

/// Notifier pour la vue d'ensemble du stock (Riverpod 3.x)
class StockOverviewNotifier extends Notifier<AsyncValue<StockOverview>> {
  late final StockStatsRepository _repository;

  @override
  AsyncValue<StockOverview> build() {
    _repository = ref.watch(stockStatsRepositoryProvider);
    loadOverview();
    return const AsyncLoading();
  }

  Future<void> loadOverview() async {
    try {
      final data = await _repository.fetchOverview();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour StockOverviewNotifier
final stockOverviewNotifierProvider = NotifierProvider<
    StockOverviewNotifier, AsyncValue<StockOverview>>(
  StockOverviewNotifier.new,
);

// ==========================================
// StockStats
// ==========================================

/// Notifier pour les statistiques du stock (Riverpod 3.x)
class StockStatsNotifier extends Notifier<AsyncValue<StockStats>> {
  late final StockStatsRepository _repository;

  @override
  AsyncValue<StockStats> build() {
    _repository = ref.watch(stockStatsRepositoryProvider);
    loadStats();
    return const AsyncLoading();
  }

  Future<void> loadStats() async {
    try {
      final data = await _repository.fetchStats();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour StockStatsNotifier
final stockStatsNotifierProvider = NotifierProvider<
    StockStatsNotifier, AsyncValue<StockStats>>(
  StockStatsNotifier.new,
);