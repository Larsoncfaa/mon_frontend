import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/order_line.dart';
import '../repositories/order_line_repository.dart';

class OrderLineNotifier extends StateNotifier<AsyncValue<List<OrderLine>>> {
  final OrderLineRepository _repository;

  OrderLineNotifier(this._repository) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load({int page = 1}) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getAll(page: page);
      state = AsyncValue.data(result.results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await load();
  }
}
