import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_overview.dart';
import '../../models/stock_stats.dart';
import '../../services/stock_stats_service.dart';
import '../notifications/stock_stats_notifier.dart';
import '../repositories/stock_stats_repository.dart';

/// 1. Service Provider
final stockStatsServiceProvider = Provider<StockStatsService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockStatsService(dio);
});

/// 2. Repository Provider
final stockStatsRepositoryProvider = Provider<StockStatsRepository>((ref) {
  final service = ref.watch(stockStatsServiceProvider);
  return StockStatsRepository(service);
});

/// 3. Notifier Provider pour l'aperçu général du stock (Riverpod 3.x)
final stockOverviewNotifierProvider =
NotifierProvider<StockOverviewNotifier, AsyncValue<StockOverview>>(
  StockOverviewNotifier.new,
);

/// 4. Notifier Provider pour les statistiques de stock (Riverpod 3.x)
final stockStatsNotifierProvider =
NotifierProvider<StockStatsNotifier, AsyncValue<StockStats>>(
  StockStatsNotifier.new,
);