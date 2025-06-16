import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/order_line.dart';
import '../repositories/order_line_repository.dart';

class OrderLineNotifier extends StateNotifier<AsyncValue<List<OrderLine>>> {
  final OrderLineRepository _repository;

  OrderLineNotifier(this._repository) : super(const AsyncValue.loading()) {
    load();
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
