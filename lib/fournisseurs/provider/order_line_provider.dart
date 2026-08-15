import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/order_line.dart';
import '../../pagination/paginated_order_line_list.dart';
import '../../services/order_line_service.dart';
import '../repositories/order_line_repository.dart';

/// 1. Service Provider
final orderLineServiceProvider = Provider<OrderLineService>((ref) {
  return OrderLineService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final orderLineRepositoryProvider = Provider<OrderLineRepository>((ref) {
  return OrderLineRepository(ref.watch(orderLineServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class OrderLineNotifier extends Notifier<AsyncValue<List<OrderLine>>> {
  @override
  AsyncValue<List<OrderLine>> build() {
    Future.microtask(() => load());
    return const AsyncValue.loading();
  }

  Future<void> load({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(orderLineRepositoryProvider);
      final result = await repository.getAll(page: page);
      state = AsyncData(result.results);
    } catch (e, st) {
      debugPrint('Erreur lors du chargement des order lines : $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await load();
  }
}

/// 3. Notifier Provider principal
final orderLineNotifierProvider = NotifierProvider<
    OrderLineNotifier, AsyncValue<List<OrderLine>>>(
  OrderLineNotifier.new,
);

/// 4. Pour accéder à un OrderLine unique par ID
final orderLineByIdProvider = FutureProvider.family<OrderLine, int>((ref, id) async {
  final repo = ref.watch(orderLineRepositoryProvider);
  return repo.getOne(id);
});

/// 5. Pour accéder aux OrderLines filtrées par commande (orderId)
final orderLinesByOrderIdProvider = FutureProvider.family<PaginatedOrderLineList, int>((ref, orderId) async {
  final repo = ref.watch(orderLineRepositoryProvider);
  return repo.getByOrderId(orderId);
});
