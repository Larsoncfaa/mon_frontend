

import '../../models/payment.dart';
import '../../services/payment_service.dart';

class PaymentRepository {
  final PaymentService _service;

  PaymentRepository(this._service);

  Future<Payment> getPayment(int id) => _service.fetchPayment(id);

  Future<Payment> createPayment(Payment payment) =>
      _service.createPayment(payment);

  Future<Payment> updatePayment(int id, Payment payment) =>
      _service.updatePayment(id, payment);

  Future<void> deletePayment(int id) => _service.deletePayment(id);
}
