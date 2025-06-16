import 'dart:developer';
import 'package:flutter/foundation.dart';
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
      debugPrint('✅ Paiement chargé: ${payment.id}');
      state = AsyncValue.data(payment);
    } catch (e, st) {
      debugPrint('❌ Erreur loadPayment($id): $e');
      log('Erreur loadPayment', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
    }
  }

  /// Crée un nouveau paiement
  Future<Payment> createPaymentForOrder({
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
        paidAt: DateTime.now().toUtc(),
        id: null,
      );
      final result = await _repository.createPayment(payment);
      debugPrint('✅ Paiement créé pour commande #$orderId');
      state = AsyncValue.data(result);
      return result;
    } catch (e, st) {
      debugPrint('❌ Erreur createPaymentForOrder: $e');
      log('Erreur createPaymentForOrder', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  /// Met à jour un paiement existant
  Future<void> update(int id, Payment payment) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _repository.updatePayment(id, payment);
      debugPrint('✅ Paiement mis à jour: ${updated.id}');
      state = AsyncValue.data(updated);
    } catch (e, st) {
      debugPrint('❌ Erreur update($id): $e');
      log('Erreur updatePayment', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
    }
  }

  /// Supprime un paiement
  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      await _repository.deletePayment(id);
      debugPrint('✅ Paiement supprimé: $id');
      state = const AsyncValue.data(null);
    } catch (e, st) {
      debugPrint('❌ Erreur delete($id): $e');
      log('Erreur deletePayment', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
    }
  }

  /// Crée un paiement pour une commande
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
        paidAt: DateTime.now().toUtc(),
        id: null,
      );
      final result = await _repository.createPayment(payment);
      debugPrint('✅ Paiement effectué pour commande #$orderId');
      state = AsyncValue.data(result);
      return true;
    } catch (e, st) {
      debugPrint('❌ Erreur payerCommande($orderId): $e');
      log('Erreur payerCommande', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
      return false;
    }
  }
  String? lastErrorMessage;

}
