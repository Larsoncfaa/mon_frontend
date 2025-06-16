import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/order.dart';
import '../../pagination/paginated_order_list.dart';
import '../repositories/order_repository.dart';

class OrderNotifier extends StateNotifier<AsyncValue<PaginatedOrderList>> {
  final OrderRepository repository;
  int _currentPage = 1;
  bool isFetchingMore = false;

  OrderNotifier(this.repository) : super(const AsyncLoading()) {
    fetchOrders();
  }

  Future<void> fetchOrders({int page = 1}) async {
    state = const AsyncLoading();
    try {
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
  }Future<Order> createOrderFromCart() async {
    try {
      final order = await repository.createOrderFromCart();
      debugPrint('Commande créée: ${order.id}');
      return order;
    } catch (e, st) {
      debugPrint('Erreur commande: $e');
      rethrow;
    }
  }
}
