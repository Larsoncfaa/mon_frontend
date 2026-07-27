import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/order_line.dart';
import '../../pagination/paginated_order_line_list.dart';
import '../../services/order_line_service.dart';
import '../notifications/order_line_notifier.dart';
import '../repositories/order_line_repository.dart';

/// 1. Service Provider
final orderLineServiceProvider = Provider<OrderLineService>(
      (ref) => OrderLineService(ref.watch(dioProvider)),
);

/// 2. Repository Provider
final orderLineRepositoryProvider = Provider<OrderLineRepository>(
      (ref) => OrderLineRepository(ref.watch(orderLineServiceProvider)),
);

/// 3. Notifier Provider (Riverpod 3.x)
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