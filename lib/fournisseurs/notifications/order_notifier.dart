import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../repositories/order_repository.dart';

// Provider du repository (à adapter selon ton projet)
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('Initialisez votre OrderRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class OrderNotifier extends Notifier<AsyncValue<PaginatedOrderList>> {
  late final OrderRepository _repository;
  int _currentPage = 1;
  bool isFetchingMore = false;

  @override
  AsyncValue<PaginatedOrderList> build() {
    _repository = ref.watch(orderRepositoryProvider);
    fetchOrders();
    return const AsyncLoading();
  }

  Future<void> fetchOrders({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final orders = await _repository.fetchOrders(page: page);
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
      await _repository.deleteOrder(id);
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
      final nextPage = _currentPage + 1;
      final nextData = await _repository.fetchOrders(page: nextPage);

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
      final order = await _repository.createOrderFromCart();
      debugPrint('Commande créée: ${order.id}');
      return order;
    } catch (e, st) {
      debugPrint('Erreur commande: $e');
      rethrow;
    }
  }
}

/// Provider pour Riverpod 3.x
final orderNotifierProvider = NotifierProvider<
    OrderNotifier, AsyncValue<PaginatedOrderList>>(
  OrderNotifier.new,
);