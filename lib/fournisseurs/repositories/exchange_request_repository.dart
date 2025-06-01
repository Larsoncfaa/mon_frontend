

import '../../models/exchange_request.dart';
import '../../pagination/paginated_exchange_request_list.dart';
import '../../services/exchange_request_service.dart';

class ExchangeRequestRepository {
  final ExchangeRequestService service;

  ExchangeRequestRepository(this.service);

  Future<PaginatedExchangeRequestList> fetchAll({int page = 1}) {
    return service.fetchExchangeRequests(page: page);
  }

  Future<ExchangeRequest> get(int id) => service.getExchangeRequest(id);

  Future<ExchangeRequest> create(ExchangeRequest data) =>
      service.createExchangeRequest(data);

  Future<ExchangeRequest> update(int id, ExchangeRequest data) =>
      service.updateExchangeRequest(id, data);

  Future<void> delete(int id) => service.deleteExchangeRequest(id);
}
