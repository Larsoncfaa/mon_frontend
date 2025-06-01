import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/method_enum.dart';
import '../../models/payment.dart';
import '../../models/payment_status_enum.dart';
import '../repositories/payment_repository.dart';

class PaymentNotifier extends StateNotifier<AsyncValue<Payment?>> {
  final PaymentRepository _repository;

  PaymentNotifier(this._repository) : super(const AsyncValue.data(null));

  /// Charge un paiement depuis l’API
  Future<void> loadPayment(int id) async {
    state = const AsyncValue.loading();
    try {
      final payment = await _repository.getPayment(id);
      state = AsyncValue.data(payment);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Crée un nouveau paiement
  Future<void> create(Payment payment) async {
    state = const AsyncValue.loading();
    try {
      final created = await _repository.createPayment(payment);
      state = AsyncValue.data(created);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Met à jour un paiement existant
  Future<void> update(int id, Payment payment) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _repository.updatePayment(id, payment);
      state = AsyncValue.data(updated);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Supprime un paiement
  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      await _repository.deletePayment(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<bool> payerCommande({
    required int orderId,
    required double amount,
    required MethodEnum method,
  }) async {
    state = const AsyncValue.loading();
    try {
      final payment = Payment(
        order: orderId,
        method: method,
        amount: amount,
        paymentStatus: PaymentStatusEnum.pending,
        paidAt: DateTime.now().toUtc(), id: null,
      );
      final result = await _repository.createPayment(payment);
      state = AsyncValue.data(result);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
