import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../../services/payment_log_service.dart';
import '../notifications/payment_log_notifier.dart';
import '../repositories/payment_log_repository.dart';

/// Fournisseur de service avec gestion d'erreur
final paymentLogServiceProvider = Provider<PaymentLogService>((ref) {
  try {
    return PaymentLogService(ref.watch(dioProvider));
  } catch (e, st) {
    // Log ou rethrow si nécessaire
    throw Exception('Erreur lors de la création du PaymentLogService: $e');
  }
});

/// Fournisseur de repository avec gestion d'erreur
final paymentLogRepositoryProvider = Provider<PaymentLogRepository>((ref) {
  try {
    return PaymentLogRepository(ref.watch(paymentLogServiceProvider));
  } catch (e, st) {
    throw Exception('Erreur lors de la création du PaymentLogRepository: $e');
  }
});

/// Fournisseur de notifier avec gestion d'erreur
final paymentLogNotifierProvider = StateNotifierProvider<PaymentLogNotifier, AsyncValue<PaginatedPaymentLogList>>(
      (ref) {
    try {
      return PaymentLogNotifier(ref.watch(paymentLogRepositoryProvider));
    } catch (e, st) {
      throw Exception('Erreur lors de la création du PaymentLogNotifier: $e');
    }
  },
);
