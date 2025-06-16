import 'package:dio/dio.dart';
import '../models/stock_overview.dart';
import '../models/stock_stats.dart';

class StockStatsService {
  final Dio dio;

  StockStatsService(this.dio);

  Future<StockOverview> fetchOverview() async {
    final response = await dio.get('/stats/overview/');
    return StockOverview.fromJson(response.data);
  }

  Future<StockStats> fetchStats() async {
    final response = await dio.get('/stats/');
    return StockStats.fromJson(response.data);
  }
}
