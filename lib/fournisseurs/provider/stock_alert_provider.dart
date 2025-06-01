import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_alert.dart';
import '../../pagination/paginated_stock_alert_list.dart';
import '../../services/stock_alert_service.dart';
import '../notifications/stock_alert_notifier.dart';
import '../repositories/stock_alert_repository.dart';




final stockAlertServiceProvider = Provider<StockAlertService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockAlertService(dio);
});

final stockAlertRepositoryProvider = Provider<StockAlertRepository>((ref) {
  final service = ref.watch(stockAlertServiceProvider);
  return StockAlertRepository(service);
});

final stockAlertNotifierProvider = StateNotifierProvider<StockAlertNotifier, AsyncValue<PaginatedStockAlertList>>((ref) {
  final repository = ref.watch(stockAlertRepositoryProvider);
  return StockAlertNotifier(repository);
});

final stockAlertByIdProvider = FutureProvider.family<StockAlert, int>((ref, id) async {
  final repository = ref.watch(stockAlertRepositoryProvider);
  return repository.getStockAlert(id);
});
