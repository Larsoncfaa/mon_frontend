import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_order_list.dart';
import '../repositories/order_repository.dart';

class OrderNotifier extends StateNotifier<AsyncValue<PaginatedOrderList>> {
  final OrderRepository repository;
  int _currentPage = 1;
  bool isFetchingMore = false;

  OrderNotifier(this.repository) : super(const AsyncLoading()) {
    fetchOrders();
  }

  /// Charge la première page
  Future<void> fetchOrders({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final orders = await repository.fetchOrders(page: page);
      _currentPage = page;
      state = AsyncData(orders);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Rafraîchit la page courante
  Future<void> refresh() async {
    await fetchOrders(page: _currentPage);
  }

  /// Supprime une commande et recharge
  Future<void> deleteOrder(int id) async {
    try {
      await repository.deleteOrder(id);
      await fetchOrders(page: _currentPage);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Charge la page suivante en appendant les résultats
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
      state = AsyncError(e, st);
    } finally {
      isFetchingMore = false;
    }
  }
}
