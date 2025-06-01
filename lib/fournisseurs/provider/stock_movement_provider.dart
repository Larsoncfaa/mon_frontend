import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/stock_movement.dart';
import '../../pagination/paginated_stock_movement_list.dart';
import '../../services/stock_movement_service.dart';
import '../notifications/stock_movement_notifier.dart';
import '../repositories/stock_movement_repository.dart';




/// Fournisseur du service de mouvement de stock
final stockMovementServiceProvider = Provider<StockMovementService>((ref) {
  final dio = ref.watch(dioProvider);
  return StockMovementService(dio);
});

/// Fournisseur du repository de mouvement de stock
final stockMovementRepositoryProvider = Provider<StockMovementRepository>((ref) {
  final service = ref.watch(stockMovementServiceProvider);
  return StockMovementRepository(service);
});

/// Fournisseur principal de la liste paginée
final stockMovementNotifierProvider = StateNotifierProvider<StockMovementNotifier, AsyncValue<PaginatedStockMovementList>>((ref) {
  final repository = ref.watch(stockMovementRepositoryProvider);
  return StockMovementNotifier(repository);
});

/// Fournisseur individuel par ID
final stockMovementByIdProvider = FutureProvider.family<StockMovement, int>((ref, id) async {
  final repository = ref.watch(stockMovementRepositoryProvider);
  return repository.getStockMovement(id);
});
