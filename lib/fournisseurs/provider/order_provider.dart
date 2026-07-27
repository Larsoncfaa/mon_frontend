import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../../services/order_service.dart';
import '../notifications/order_notifier.dart';
import '../repositories/order_repository.dart';

/// 1. Service Provider
final orderServiceProvider = Provider<OrderService>((ref) {
  final dio = ref.watch(dioProvider);
  return OrderService(dio);
});

/// 2. Repository Provider
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final service = ref.watch(orderServiceProvider);
  return OrderRepository(service);
});

/// 3. Notifier Provider (Riverpod 3.x)
final orderNotifierProvider =
NotifierProvider<OrderNotifier, AsyncValue<PaginatedOrderList>>(
  OrderNotifier.new,
);

/// 4. Provider pour accéder à une commande unique par son ID
final orderByIdProvider = FutureProvider.family<Order, int>((ref, id) async {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getOrder(id);
});