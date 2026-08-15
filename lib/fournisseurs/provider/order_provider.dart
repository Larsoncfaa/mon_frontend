import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../../services/order_service.dart';
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

/// Notifier moderne pour Riverpod 3.x
class OrderNotifier extends Notifier<AsyncValue<PaginatedOrderList>> {
  int _currentPage = 1;
  bool isFetchingMore = false;

  @override
  AsyncValue<PaginatedOrderList> build() {
    Future.microtask(() => fetchOrders());
    return const AsyncLoading();
  }

  Future<void> fetchOrders({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(orderRepositoryProvider);
      final orders = await repository.fetchOrders(page: page);
      _currentPage = page;
      state = AsyncData(orders);
    } catch (e, st) {
      debugPrint('Erreur fetchOrders: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchOrders(page: _currentPage);
  }

  Future<void> deleteOrder(int id) async {
    try {
      final repository = ref.read(orderRepositoryProvider);
      await repository.deleteOrder(id);
      await fetchOrders(page: _currentPage);
    } catch (e, st) {
      debugPrint('Erreur deleteOrder: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> fetchNextPage() async {
    final current = state;
    if (current is! AsyncData || current.value?.next == null || isFetchingMore) return;

    isFetchingMore = true;
    try {
      final repository = ref.read(orderRepositoryProvider);
      final nextPage = _currentPage + 1;
      final nextData = await repository.fetchOrders(page: nextPage);

      final combined = current.value?.copyWith(
        results: [...?current.value?.results, ...?nextData.results],
        next: nextData.next,
        previous: nextData.previous,
        count: nextData.count,
      );

      _currentPage = nextPage;
      state = AsyncData(combined!);
    } catch (e, st) {
      debugPrint('Erreur fetchNextPage: $e');
      state = AsyncError(e, st);
    } finally {
      isFetchingMore = false;
    }
  }

  Future<Order> createOrderFromCart() async {
    try {
      final repository = ref.read(orderRepositoryProvider);
      final order = await repository.createOrderFromCart();
      debugPrint('Commande créée: ${order.id}');
      return order;
    } catch (e, st) {
      debugPrint('Erreur commande: $e');
      rethrow;
    }
  }
}

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
