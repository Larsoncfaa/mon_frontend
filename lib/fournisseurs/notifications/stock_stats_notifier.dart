import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/stock_overview.dart';
import '../../models/stock_stats.dart';
import '../repositories/stock_stats_repository.dart';

class StockOverviewNotifier extends StateNotifier<AsyncValue<StockOverview>> {
  final StockStatsRepository repository;

  StockOverviewNotifier(this.repository) : super(const AsyncLoading()) {
    loadOverview();
  }

  Future<void> loadOverview() async {
    try {
      final data = await repository.fetchOverview();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

class StockStatsNotifier extends StateNotifier<AsyncValue<StockStats>> {
  final StockStatsRepository repository;

  StockStatsNotifier(this.repository) : super(const AsyncLoading()) {
    loadStats();
  }

  Future<void> loadStats() async {
    try {
      final data = await repository.fetchStats();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
