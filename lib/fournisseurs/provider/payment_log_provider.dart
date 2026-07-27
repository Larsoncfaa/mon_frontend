import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../../services/payment_log_service.dart';
import '../notifications/payment_log_notifier.dart';
import '../repositories/payment_log_repository.dart';

/// 1. Service Provider
final paymentLogServiceProvider = Provider<PaymentLogService>((ref) {
  try {
    return PaymentLogService(ref.watch(dioProvider));
  } catch (e, st) {
    throw Exception('Erreur lors de la création du PaymentLogService: $e');
  }
});

/// 2. Repository Provider
final paymentLogRepositoryProvider = Provider<PaymentLogRepository>((ref) {
  try {
    return PaymentLogRepository(ref.watch(paymentLogServiceProvider));
  } catch (e, st) {
    throw Exception('Erreur lors de la création du PaymentLogRepository: $e');
  }
});

/// 3. Notifier Provider (Riverpod 3.x)
final paymentLogNotifierProvider = NotifierProvider<
    PaymentLogNotifier, AsyncValue<PaginatedPaymentLogList>>(
  PaymentLogNotifier.new,
);