import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/order_line.dart';
import '../repositories/order_line_repository.dart';

// Provider du repository (à adapter selon ton projet)
final orderLineRepositoryProvider = Provider<OrderLineRepository>((ref) {
  throw UnimplementedError('Initialisez votre OrderLineRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class OrderLineNotifier extends Notifier<AsyncValue<List<OrderLine>>> {
  late final OrderLineRepository _repository;

  @override
  AsyncValue<List<OrderLine>> build() {
    _repository = ref.watch(orderLineRepositoryProvider);
    load();
    return const AsyncValue.loading();
  }

  Future<void> load({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await _repository.getAll(page: page);
      state = AsyncData(result.results);
    } catch (e, st) {
      debugPrint('Erreur lors du chargement des order lines : $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await load();
  }
}

/// Provider pour Riverpod 3.x
final orderLineNotifierProvider = NotifierProvider<
    OrderLineNotifier, AsyncValue<List<OrderLine>>>(
  OrderLineNotifier.new,
);