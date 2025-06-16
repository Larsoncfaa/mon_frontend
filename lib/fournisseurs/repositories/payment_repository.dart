import 'dart:developer';
import 'package:flutter/foundation.dart';
import '../../models/payment.dart';
import '../../services/payment_service.dart';

class PaymentRepository {
  final PaymentService _service;

  PaymentRepository(this._service);

  Future<Payment> getPayment(int id) async {
    try {
      final payment = await _service.fetchPayment(id);
      debugPrint('✅ Paiement récupéré dans le repository: ${payment.id}');
      return payment;
    } catch (e, st) {
      debugPrint('❌ Erreur getPayment($id): $e');
      log('Erreur getPayment', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<Payment> createPayment(Payment payment) async {
    try {
      final newPayment = await _service.createPayment(payment);
      debugPrint('✅ Paiement créé dans le repository: ${newPayment.id}');
      return newPayment;
    } catch (e, st) {
      debugPrint('❌ Erreur createPayment: $e');
      log('Erreur createPayment', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<Payment> updatePayment(int id, Payment payment) async {
    try {
      final updated = await _service.updatePayment(id, payment);
      debugPrint('✅ Paiement mis à jour dans le repository: ${updated.id}');
      return updated;
    } catch (e, st) {
      debugPrint('❌ Erreur updatePayment($id): $e');
      log('Erreur updatePayment', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<void> deletePayment(int id) async {
    try {
      await _service.deletePayment(id);
      debugPrint('✅ Paiement supprimé dans le repository: $id');
    } catch (e, st) {
      debugPrint('❌ Erreur deletePayment($id): $e');
      log('Erreur deletePayment', error: e, stackTrace: st);
      rethrow;
    }
  }
}
