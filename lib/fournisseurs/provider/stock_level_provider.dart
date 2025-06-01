// lib/providers/stock_level_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_stock_level.dart';
import '../../services/stock_level_service.dart';
import '../notifications/stock_level_notifier.dart';
import '../repositories/stock_level_repository.dart';



/// Fournit une instance du service StockLevelService
final stockLevelServiceProvider = Provider<StockLevelService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockLevelService(dio);
});

/// Fournit une instance du repository StockLevelRepository
final stockLevelRepositoryProvider = Provider<StockLevelRepository>((ref) {
  final service = ref.watch(stockLevelServiceProvider);
  return StockLevelRepository(service);
});

/// Fournit un StockLevelNotifier (avec la liste paginée)
final stockLevelNotifierProvider = StateNotifierProvider<StockLevelNotifier, AsyncValue<PaginatedStockLevel>>((ref) {
  final repository = ref.watch(stockLevelRepositoryProvider);
  return StockLevelNotifier(repository);
});
