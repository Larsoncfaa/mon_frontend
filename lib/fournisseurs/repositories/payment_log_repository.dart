

import '../../models/payment_log.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../../services/payment_log_service.dart';

class PaymentLogRepository {
  final PaymentLogService _service;

  PaymentLogRepository(this._service);

  Future<PaginatedPaymentLogList> getAll({int page = 1}) {
    return _service.fetchAll(page: page);
  }

  Future<PaymentLog> getById(int id) {
    return _service.fetchById(id);
  }

  Future<PaymentLog> create(PaymentLog log) {
    return _service.create(log);
  }

  Future<PaymentLog> update(int id, PaymentLog log) {
    return _service.update(id, log);
  }

  Future<void> delete(int id) {
    return _service.delete(id);
  }
}
