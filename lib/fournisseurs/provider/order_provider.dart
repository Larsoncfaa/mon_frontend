import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../../services/order_service.dart';
import '../notifications/order_notifier.dart';
import '../repositories/order_repository.dart';




/// Service
final orderServiceProvider = Provider<OrderService>((ref) {
  final dio = ref.watch(dioProvider);
  return OrderService(dio);
});

/// Repository
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final service = ref.watch(orderServiceProvider);
  return OrderRepository(service);
});

/// Notifier
final orderNotifierProvider = StateNotifierProvider<OrderNotifier, AsyncValue<PaginatedOrderList>>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderNotifier(repository);
});

/// Provider pour accéder à une commande unique
final orderByIdProvider = FutureProvider.family<Order, int>((ref, id) async {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getOrder(id);
});
