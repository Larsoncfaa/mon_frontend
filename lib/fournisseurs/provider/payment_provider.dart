import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/payment.dart';
import '../../services/payment_service.dart';
import '../notifications/payment_notifier.dart';
import '../repositories/payment_repository.dart';

/// Fournisseur de Dio (à configurer avec baseUrl et headers ailleurs)


/// Fournisseur de service
final paymentServiceProvider = Provider<PaymentService>(
      (ref) => PaymentService(ref.watch(dioProvider)),
);

/// Fournisseur de repository
final paymentRepositoryProvider = Provider<PaymentRepository>(
      (ref) => PaymentRepository(ref.watch(paymentServiceProvider)),
);

/// Fournisseur de notifier
final paymentNotifierProvider =
StateNotifierProvider<PaymentNotifier, AsyncValue<Payment?>>(
      (ref) => PaymentNotifier(ref.watch(paymentRepositoryProvider)),
);
