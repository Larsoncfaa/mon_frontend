import '../../models/payment_log.dart';
import '../../pagination/paginated_payment_log_list.dart';
import '../../services/payment_log_service.dart';

class PaymentLogRepository {
  final PaymentLogService _service;

  PaymentLogRepository(this._service);

  Future<PaginatedPaymentLogList> getAll({int page = 1}) async {
    try {
      return await _service.fetchAll(page: page);
    } catch (e) {
      throw Exception('Erreur lors du chargement des journaux de paiement (page $page) : $e');
    }
  }

  Future<PaymentLog> getById(int id) async {
    try {
      return await _service.fetchById(id);
    } catch (e) {
      throw Exception('Erreur lors de la récupération du journal de paiement $id : $e');
    }
  }

  Future<PaymentLog> create(PaymentLog log) async {
    try {
      return await _service.create(log);
    } catch (e) {
      throw Exception('Erreur lors de la création du journal de paiement : $e');
    }
  }

  Future<PaymentLog> update(int id, PaymentLog log) async {
    try {
      return await _service.update(id, log);
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour du journal de paiement $id : $e');
    }
  }

  Future<void> delete(int id) async {
    try {
      await _service.delete(id);
    } catch (e) {
      throw Exception('Erreur lors de la suppression du journal de paiement $id : $e');
    }
  }
}
