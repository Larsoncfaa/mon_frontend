import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/models/exchange_request.dart';

import '../../models/exchange_status_enum.dart';
import '../../pagination/paginated_exchange_request_list.dart';
import '../repositories/exchange_request_repository.dart';

class ExchangeRequestNotifier
    extends StateNotifier<AsyncValue<PaginatedExchangeRequestList>> {
  final ExchangeRequestRepository repository;

  ExchangeRequestNotifier(this.repository)
      : super(const AsyncLoading()) {
    loadExchangeRequests();
  }

  int _currentPage = 1;

  Future<void> loadExchangeRequests({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchAll(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  int get currentPage => _currentPage;

  Future<void> create(ExchangeRequest exchangeRequest) async {
    try {
      final created = await repository.create(exchangeRequest);
      final previous = state.value;
      if (previous != null) {
        final updatedResults = [...previous.results, created];
        state = AsyncData(
          previous.copyWith(results: updatedResults),
        );
      } else {
        // Recharge si la liste était vide
        await loadExchangeRequests(page: _currentPage);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> update(int id, ExchangeRequest updatedExchange) async {
    try {
      final updated = await repository.update(id, updatedExchange);
      final previous = state.value;
      if (previous != null) {
        final updatedResults = previous.results
            .map((e) => e.id == id ? updated : e)
            .toList();
        state = AsyncData(previous.copyWith(results: updatedResults));
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> delete(int id) async {
    try {
      await repository.delete(id);
      final previous = state.value;
      if (previous != null) {
        final updatedResults =
        previous.results.where((e) => e.id != id).toList();
        state = AsyncData(previous.copyWith(results: updatedResults));
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Accepter une demande d'échange : met à jour son statut sur 'COMPLETED'
  Future<void> accepter(int id) async {
    try {
      final previous = state.value;
      if (previous == null) return;
      // Récupère l'objet à mettre à jour
      final exchange = previous.results.firstWhere((e) => e.id == id);
      // Crée une nouvelle instance avec le statut à ExchangeStatusEnum.COMPLETED
      final updatedExchange = exchange.copyWith(
        exchangeStatus: ExchangeStatusEnum.COMPLETED,
      );
      // Appel API (update et mise à jour du state)
      await update(id, updatedExchange);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Refuser une demande d'échange : supprime la demande
  Future<void> refuser(int id) async {
    try {
      await delete(id);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
