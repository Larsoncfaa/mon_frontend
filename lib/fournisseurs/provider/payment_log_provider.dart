import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../../services/payment_log_service.dart';
import '../repositories/payment_log_repository.dart';

/// 1. Service Provider
final paymentLogServiceProvider = Provider<PaymentLogService>((ref) {
  return PaymentLogService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final paymentLogRepositoryProvider = Provider<PaymentLogRepository>((ref) {
  return PaymentLogRepository(ref.watch(paymentLogServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class PaymentLogNotifier extends Notifier<AsyncValue<PaginatedPaymentLogList>> {
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedPaymentLogList> build() {
    Future.microtask(() => fetchAll());
    return const AsyncLoading();
  }

  Future<void> fetchAll({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(paymentLogRepositoryProvider);
      final data = await repository.getAll(page: page);
      _currentPage = page;
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> fetchPaymentLogs({int page = 1}) => fetchAll(page: page);

  Future<void> refresh() async => fetchAll();

  Future<void> loadMore() async {
    final current = state.value;
    if (current?.next != null) {
      await fetchAll(page: _currentPage + 1);
    }
  }

  Future<void> delete(int id) async {
    try {
      final repository = ref.read(paymentLogRepositoryProvider);
      await repository.delete(id);
      await fetchAll();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final paymentLogNotifierProvider = NotifierProvider<
    PaymentLogNotifier, AsyncValue<PaginatedPaymentLogList>>(
  PaymentLogNotifier.new,
);
