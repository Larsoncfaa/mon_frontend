import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../../services/payment_log_service.dart';
import '../notifications/payment_log_notifier.dart';
import '../repositories/payment_log_repository.dart';





// Fournisseur de service
final paymentLogServiceProvider = Provider<PaymentLogService>((ref) {
  return PaymentLogService(ref.watch(dioProvider));
});

// Fournisseur de repository
final paymentLogRepositoryProvider = Provider<PaymentLogRepository>((ref) {
  return PaymentLogRepository(ref.watch(paymentLogServiceProvider));
});

// Fournisseur de notifier
final paymentLogNotifierProvider = StateNotifierProvider<PaymentLogNotifier, AsyncValue<PaginatedPaymentLogList>>(
      (ref) => PaymentLogNotifier(ref.watch(paymentLogRepositoryProvider)),
);
