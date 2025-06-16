import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/stock_overview.dart';
import '../../models/stock_stats.dart';
import '../../services/stock_stats_service.dart';
import '../notifications/stock_stats_notifier.dart';
import '../repositories/stock_stats_repository.dart';



final stockStatsServiceProvider = Provider<StockStatsService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockStatsService(dio);
});

final stockStatsRepositoryProvider = Provider<StockStatsRepository>((ref) {
  final service = ref.watch(stockStatsServiceProvider);
  return StockStatsRepository(service);
});

final stockOverviewNotifierProvider = StateNotifierProvider<StockOverviewNotifier, AsyncValue<StockOverview>>((ref) {
  final repo = ref.watch(stockStatsRepositoryProvider);
  return StockOverviewNotifier(repo);
});

final stockStatsNotifierProvider = StateNotifierProvider<StockStatsNotifier, AsyncValue<StockStats>>((ref) {
  final repo = ref.watch(stockStatsRepositoryProvider);
  return StockStatsNotifier(repo);
});
