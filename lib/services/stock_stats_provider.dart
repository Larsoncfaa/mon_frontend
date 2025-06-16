import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/network/dio_provider.dart';
import '../services/stock_stats_service.dart';
import '../models/stock_overview.dart';
import '../models/stock_stats.dart';

final stockStatsServiceProvider = Provider<StockStatsService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockStatsService(dio);
});

final stockOverviewProvider = FutureProvider<StockOverview>((ref) async {
  return ref.watch(stockStatsServiceProvider).fetchOverview();
});

final stockStatsProvider = FutureProvider<StockStats>((ref) async {
  return ref.watch(stockStatsServiceProvider).fetchStats();
});
