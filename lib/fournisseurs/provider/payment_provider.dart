import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/payment.dart';
import '../../services/payment_service.dart';
import '../notifications/payment_notifier.dart';
import '../repositories/payment_repository.dart';

/// 🔌 Fournisseur du service PaymentService
final paymentServiceProvider = Provider<PaymentService>(
      (ref) => PaymentService(ref.watch(dioProvider)),
);

/// 🏗️ Fournisseur du repository PaymentRepository
final paymentRepositoryProvider = Provider<PaymentRepository>(
      (ref) => PaymentRepository(ref.watch(paymentServiceProvider)),
);

/// 📡 Fournisseur du notifier PaymentNotifier (Riverpod 3.x)
final paymentNotifierProvider =
NotifierProvider<PaymentNotifier, AsyncValue<Payment?>>(
  PaymentNotifier.new,
);