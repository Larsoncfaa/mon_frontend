import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/method_enum.dart';
import '../../models/payment.dart';
import '../../models/payment_status_enum.dart';
import '../../services/payment_service.dart';
import '../repositories/payment_repository.dart';

/// 1. Service Provider
final paymentServiceProvider = Provider<PaymentService>((ref) {
  return PaymentService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepository(ref.watch(paymentServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class PaymentNotifier extends Notifier<AsyncValue<Payment?>> {
  String? lastErrorMessage;

  @override
  AsyncValue<Payment?> build() {
    return const AsyncValue.data(null);
  }

  /// Charge un paiement depuis l’API
  Future<void> loadPayment(int id) async {
    state = const AsyncValue.loading();
    lastErrorMessage = null;
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final payment = await repository.getPayment(id);
      state = AsyncValue.data(payment);
    } catch (e, st) {
      lastErrorMessage = e.toString();
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
    lastErrorMessage = null;
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final payment = Payment(
        order: orderId,
        method: method,
        amount: amount,
        paymentStatus: PaymentStatusEnum.pending,
        paidAt: DateTime.now().toUtc(),
        id: 0,
      );
      final result = await repository.createPayment(payment);
      state = AsyncValue.data(result);
      return result;
    } catch (e, st) {
      lastErrorMessage = e.toString();
      log('Erreur createPaymentForOrder', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  /// Met à jour un paiement existant
  Future<void> update(int id, Payment payment) async {
    state = const AsyncValue.loading();
    lastErrorMessage = null;
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final updated = await repository.updatePayment(id, payment);
      state = AsyncValue.data(updated);
    } catch (e, st) {
      lastErrorMessage = e.toString();
      log('Erreur updatePayment', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
    }
  }

  /// Supprime un paiement
  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    lastErrorMessage = null;
    try {
      final repository = ref.read(paymentRepositoryProvider);
      await repository.deletePayment(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      lastErrorMessage = e.toString();
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
    lastErrorMessage = null;
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final payment = Payment(
        order: orderId,
        method: method,
        amount: amount,
        paymentStatus: PaymentStatusEnum.pending,
        paidAt: DateTime.now().toUtc(),
        id: 0,
      );
      final result = await repository.createPayment(payment);
      state = AsyncValue.data(result);
      return true;
    } catch (e, st) {
      lastErrorMessage = e.toString();
      log('Erreur payerCommande', error: e, stackTrace: st);
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

/// 3. Notifier Provider principal
final paymentNotifierProvider =
NotifierProvider<PaymentNotifier, AsyncValue<Payment?>>(
  PaymentNotifier.new,
);
