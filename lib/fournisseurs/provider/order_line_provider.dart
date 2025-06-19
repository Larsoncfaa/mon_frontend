import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/order_line.dart';
import '../../pagination/paginated_order_line_list.dart';
import '../../services/order_line_service.dart';
import '../notifications/order_line_notifier.dart';
import '../repositories/order_line_repository.dart';

/// Service
final orderLineServiceProvider = Provider<OrderLineService>(
      (ref) => OrderLineService(ref.watch(dioProvider)),
);

/// Repository
final orderLineRepositoryProvider = Provider<OrderLineRepository>(
      (ref) => OrderLineRepository(ref.watch(orderLineServiceProvider)),
);

/// Notifier global (liste paginée ou simple)
final orderLineNotifierProvider = StateNotifierProvider<OrderLineNotifier, AsyncValue<List<OrderLine>>>(
      (ref) => OrderLineNotifier(ref.watch(orderLineRepositoryProvider)),
);

/// Pour accéder à un OrderLine unique par ID
final orderLineByIdProvider = FutureProvider.family<OrderLine, int>((ref, id) async {
  final repo = ref.watch(orderLineRepositoryProvider);
  return repo.getOne(id);
});
final orderLinesByOrderIdProvider = FutureProvider.family<PaginatedOrderLineList, int>((ref, orderId) async {
  final repo = ref.watch(orderLineRepositoryProvider);
  return repo.getByOrderId(orderId);
});
