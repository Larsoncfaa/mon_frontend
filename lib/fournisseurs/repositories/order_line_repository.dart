
import '../../models/order_line.dart';
import '../../pagination/paginated_order_line_list.dart';
import '../../services/order_line_service.dart';

class OrderLineRepository {
  final OrderLineService _service;

  OrderLineRepository(this._service);

  Future<PaginatedOrderLineList> getAll({int page = 1}) {
    return _service.fetchOrderLines(page: page);
  }

  Future<OrderLine> getOne(int id) {
    return _service.fetchOrderLine(id);
  }

  Future<OrderLine> create(Map<String, dynamic> data) {
    return _service.createOrderLine(data);
  }

  Future<OrderLine> update(int id, Map<String, dynamic> data) {
    return _service.updateOrderLine(id, data);
  }

  Future<void> delete(int id) {
    return _service.deleteOrderLine(id);
  }
}
