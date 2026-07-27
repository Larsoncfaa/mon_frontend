// lib/providers/stock_level_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_stock_level.dart';
import '../../services/stock_level_service.dart';
import '../notifications/stock_level_notifier.dart';
import '../repositories/stock_level_repository.dart';

/// 1. Fournit une instance du service StockLevelService
final stockLevelServiceProvider = Provider<StockLevelService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockLevelService(dio);
});

/// 2. Fournit une instance du repository StockLevelRepository
final stockLevelRepositoryProvider = Provider<StockLevelRepository>((ref) {
  final service = ref.watch(stockLevelServiceProvider);
  return StockLevelRepository(service);
});

/// 3. Fournit un StockLevelNotifier (Riverpod 3.x)
final stockLevelNotifierProvider = NotifierProvider<
    StockLevelNotifier, AsyncValue<PaginatedStockLevel>>(
  StockLevelNotifier.new,
);