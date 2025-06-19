import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/exchange_status_enum.dart';
import '../../models/exchange_request.dart';
import '../../pagination/paginated_exchange_request_list.dart';
import '../repositories/exchange_request_repository.dart';

class ExchangeRequestNotifier extends StateNotifier<AsyncValue<PaginatedExchangeRequestList>> {
  final ExchangeRequestRepository repository;

  ExchangeRequestNotifier(this.repository) : super(const AsyncLoading()) {
    loadExchangeRequests();
  }

  int _currentPage = 1;
  int get currentPage => _currentPage;

  Future<void> loadExchangeRequests({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchAll(page: page);
      _currentPage = page;
      debugPrint('ExchangeRequestNotifier: données chargées avec succès');
      state = AsyncData(result);
    } catch (e, st) {
      debugPrint('ExchangeRequestNotifier: erreur lors du chargement: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> create(ExchangeRequest exchangeRequest) async {
    try {
      final created = await repository.create(exchangeRequest);
      debugPrint('ExchangeRequestNotifier: création réussie: ${created.id}');
      final previous = state.value;
      if (previous != null) {
        final updatedResults = [...previous.results, created];
        state = AsyncData(previous.copyWith(results: updatedResults));
      } else {
        await loadExchangeRequests(page: _currentPage);
      }
    } catch (e, st) {
      debugPrint('ExchangeRequestNotifier: erreur création: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> update(int id, ExchangeRequest updatedExchange) async {
    try {
      final updated = await repository.update(id, updatedExchange);
      debugPrint('ExchangeRequestNotifier: mise à jour réussie pour id=$id');
      final previous = state.value;
      if (previous != null) {
        final updatedResults = previous.results.map((e) => e.id == id ? updated : e).toList();
        state = AsyncData(previous.copyWith(results: updatedResults));
      }
    } catch (e, st) {
      debugPrint('ExchangeRequestNotifier: erreur mise à jour: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> delete(int id) async {
    try {
      await repository.delete(id);
      debugPrint('ExchangeRequestNotifier: suppression réussie pour id=$id');
      final previous = state.value;
      if (previous != null) {
        final updatedResults = previous.results.where((e) => e.id != id).toList();
        state = AsyncData(previous.copyWith(results: updatedResults));
      }
    } catch (e, st) {
      debugPrint('ExchangeRequestNotifier: erreur suppression: $e');
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
      debugPrint('ExchangeRequestNotifier: échange accepté id=$id');
    } catch (e, st) {
      debugPrint('ExchangeRequestNotifier: erreur acceptation: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> refuser(int id) async {
    try {
      await delete(id);
      debugPrint('ExchangeRequestNotifier: échange refusé (supprimé) id=$id');
    } catch (e, st) {
      debugPrint('ExchangeRequestNotifier: erreur refus: $e');
      state = AsyncError(e, st);
    }
  }
}
