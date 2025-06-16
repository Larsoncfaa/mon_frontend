
import '../../models/stock_overview.dart';
import '../../models/stock_stats.dart';
import '../../services/stock_stats_service.dart';

class StockStatsRepository {
  final StockStatsService service;

  StockStatsRepository(this.service);

  Future<StockOverview> fetchOverview() async {
    return await service.fetchOverview();
  }

  Future<StockStats> fetchStats() async {
    return await service.fetchStats();
  }
}
