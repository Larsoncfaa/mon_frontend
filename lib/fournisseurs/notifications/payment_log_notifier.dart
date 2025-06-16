import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../repositories/payment_log_repository.dart';

class PaymentLogNotifier extends StateNotifier<AsyncValue<PaginatedPaymentLogList>> {
  final PaymentLogRepository _repository;

  PaymentLogNotifier(this._repository) : super(const AsyncLoading()) {
    fetchAll();
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

  loadMore() {}

  Future<void> delete(int id) async {
    try {
      await _repository.delete(id);
      fetchAll(); // ou remove localement si besoin
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
