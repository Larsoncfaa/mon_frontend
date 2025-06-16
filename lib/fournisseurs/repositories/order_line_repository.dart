import 'package:flutter/foundation.dart';

import '../../models/order_line.dart';
import '../../pagination/paginated_order_line_list.dart';
import '../../services/order_line_service.dart';

class OrderLineRepository {
  final OrderLineService _service;

  OrderLineRepository(this._service);

  Future<PaginatedOrderLineList> getAll({int page = 1}) async {
    try {
      return await _service.fetchOrderLines(page: page);
    } catch (e) {
      debugPrint('Erreur getAll OrderLine: $e');
      rethrow;
    }
  }

  Future<OrderLine> getOne(int id) async {
    try {
      return await _service.fetchOrderLine(id);
    } catch (e) {
      debugPrint('Erreur getOne OrderLine: $e');
      rethrow;
    }
  }

  Future<OrderLine> create(Map<String, dynamic> data) async {
    try {
      return await _service.createOrderLine(data);
    } catch (e) {
      debugPrint('Erreur create OrderLine: $e');
      rethrow;
    }
  }

  Future<OrderLine> update(int id, Map<String, dynamic> data) async {
    try {
      return await _service.updateOrderLine(id, data);
    } catch (e) {
      debugPrint('Erreur update OrderLine: $e');
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      await _service.deleteOrderLine(id);
    } catch (e) {
      debugPrint('Erreur delete OrderLine: $e');
      rethrow;
    }
  }
}
