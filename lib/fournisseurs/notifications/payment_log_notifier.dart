import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../repositories/payment_log_repository.dart';

// Provider du repository (à adapter selon ton projet)
final paymentLogRepositoryProvider = Provider<PaymentLogRepository>((ref) {
  throw UnimplementedError('Initialisez votre PaymentLogRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class PaymentLogNotifier extends Notifier<AsyncValue<PaginatedPaymentLogList>> {
  late final PaymentLogRepository _repository;

  @override
  AsyncValue<PaginatedPaymentLogList> build() {
    _repository = ref.watch(paymentLogRepositoryProvider);
    fetchAll();
    return const AsyncLoading();
  }

  Future<void> fetchAll({int page = 1}) async {
    try {
      final data = await _repository.getAll(page: page);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(Exception('Erreur lors du chargement des logs de paiement : $e'), st);
    }
  }

  Future<void> refresh() async => fetchAll();

  void loadMore() {}

  Future<void> delete(int id) async {
    try {
      await _repository.delete(id);
      await fetchAll(); // ou remove localement si besoin
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final paymentLogNotifierProvider = NotifierProvider<
    PaymentLogNotifier, AsyncValue<PaginatedPaymentLogList>>(
  PaymentLogNotifier.new,
);