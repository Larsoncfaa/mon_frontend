import 'package:dio/dio.dart';

import '../models/exchange_request.dart';
import '../pagination/paginated_exchange_request_list.dart';


class ExchangeRequestService {
  final Dio dio;

  ExchangeRequestService(this.dio);

  Future<PaginatedExchangeRequestList> fetchExchangeRequests({
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await dio.get(
      '/exchanges/',
      queryParameters: {'page': page, 'page_size': pageSize},
    );
    return PaginatedExchangeRequestList.fromJson(response.data);
  }

  Future<ExchangeRequest> getExchangeRequest(int id) async {
    final response = await dio.get('/exchanges/$id/');
    return ExchangeRequest.fromJson(response.data);
  }

  Future<ExchangeRequest> createExchangeRequest(
      ExchangeRequest data) async {
    final response =
    await dio.post('/exchanges/', data: data.toJson());
    return ExchangeRequest.fromJson(response.data);
  }

  Future<ExchangeRequest> updateExchangeRequest(
      int id, ExchangeRequest data) async {
    final response =
    await dio.put('/exchanges/$id/', data: data.toJson());
    return ExchangeRequest.fromJson(response.data);
  }

  Future<void> deleteExchangeRequest(int id) async {
    await dio.delete('/exchanges/$id/');
  }
}
