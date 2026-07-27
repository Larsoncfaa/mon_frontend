import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_alert.dart';
import '../../pagination/paginated_stock_alert_list.dart';
import '../../services/stock_alert_service.dart';
import '../notifications/stock_alert_notifier.dart';
import '../repositories/stock_alert_repository.dart';

/// 1. Service Provider
final stockAlertServiceProvider = Provider<StockAlertService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockAlertService(dio);
});

/// 2. Repository Provider
final stockAlertRepositoryProvider = Provider<StockAlertRepository>((ref) {
  final service = ref.watch(stockAlertServiceProvider);
  return StockAlertRepository(service);
});

/// 3. Notifier Provider (Riverpod 3.x)
final stockAlertNotifierProvider = NotifierProvider<
    StockAlertNotifier, AsyncValue<PaginatedStockAlertList>>(
  StockAlertNotifier.new,
);

/// 4. Provider pour récupérer une alerte de stock par son ID
final stockAlertByIdProvider =
FutureProvider.family<StockAlert, int>((ref, id) async {
  final repository = ref.watch(stockAlertRepositoryProvider);
  return repository.getStockAlert(id);
});