import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/order_line.dart';
import '../../services/order_line_service.dart';
import '../notifications/order_line_notifier.dart';
import '../repositories/order_line_repository.dart';



final orderLineServiceProvider = Provider<OrderLineService>(
      (ref) => OrderLineService(ref.watch(dioProvider)),
);

final orderLineRepositoryProvider = Provider<OrderLineRepository>(
      (ref) => OrderLineRepository(ref.watch(orderLineServiceProvider)),
);

final orderLineNotifierProvider = StateNotifierProvider<OrderLineNotifier, AsyncValue<List<OrderLine>>>(
      (ref) => OrderLineNotifier(ref.watch(orderLineRepositoryProvider)),
);
