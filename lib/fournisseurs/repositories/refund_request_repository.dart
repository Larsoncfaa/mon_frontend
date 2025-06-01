// repositories/refund_request_repository.dart



import '../../models/refund_request.dart';
import '../../services/refund_request_service.dart';

class RefundRequestRepository {
  final RefundRequestService service;

  RefundRequestRepository(this.service);

  Future<List<RefundRequest>> fetchAll() => service.getAll();

  Future<RefundRequest> fetchOne(int id) => service.get(id);

  Future<RefundRequest> create(RefundRequest data) => service.create(data);

  Future<RefundRequest> update(int id, RefundRequest data) =>
      service.update(id, data);

  Future<void> delete(int id) => service.delete(id);
}
