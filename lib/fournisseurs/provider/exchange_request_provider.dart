import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/exchange_status_enum.dart';
import '../../models/exchange_request.dart';
import '../../pagination/paginated_exchange_request_list.dart';
import '../../services/exchange_request_service.dart';
import '../repositories/exchange_request_repository.dart';

/// 1. Service Provider
final exchangeRequestServiceProvider = Provider<ExchangeRequestService>((ref) {
  return ExchangeRequestService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final exchangeRequestRepositoryProvider = Provider<ExchangeRequestRepository>((ref) {
  return ExchangeRequestRepository(ref.watch(exchangeRequestServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class ExchangeRequestNotifier extends Notifier<AsyncValue<PaginatedExchangeRequestList>> {
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedExchangeRequestList> build() {
    Future.microtask(() => loadExchangeRequests());
    return const AsyncLoading();
  }

  Future<void> loadExchangeRequests({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(exchangeRequestRepositoryProvider);
      final result = await repository.fetchAll(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> create(ExchangeRequest exchangeRequest) async {
    try {
      final repository = ref.read(exchangeRequestRepositoryProvider);
      final created = await repository.create(exchangeRequest);
      final previous = state.value;
      if (previous != null) {
        final updatedResults = [...previous.results, created];
        state = AsyncData(previous.copyWith(results: updatedResults));
      } else {
        await loadExchangeRequests(page: _currentPage);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> update(int id, ExchangeRequest updatedExchange) async {
    try {
      final repository = ref.read(exchangeRequestRepositoryProvider);
      final updated = await repository.update(id, updatedExchange);
      final previous = state.value;
      if (previous != null) {
        final updatedResults = previous.results.map((e) => e.id == id ? updated : e).toList();
        state = AsyncData(previous.copyWith(results: updatedResults));
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> delete(int id) async {
    try {
      final repository = ref.read(exchangeRequestRepositoryProvider);
      await repository.delete(id);
      final previous = state.value;
      if (previous != null) {
        final updatedResults = previous.results.where((e) => e.id != id).toList();
        state = AsyncData(previous.copyWith(results: updatedResults));
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> accepter(int id) async {
    try {
      final previous = state.value;
      if (previous == null) return;
      final exchange = previous.results.firstWhere((e) => e.id == id);
      final updatedExchange = exchange.copyWith(exchangeStatus: ExchangeStatusEnum.COMPLETED);
      await update(id, updatedExchange);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refuser(int id) async {
    try {
      await delete(id);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final exchangeRequestNotifierProvider = NotifierProvider<
    ExchangeRequestNotifier, AsyncValue<PaginatedExchangeRequestList>>(
  ExchangeRequestNotifier.new,
);
