import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/exchange_request.dart';
import '../pagination/paginated_exchange_request_list.dart';

class ExchangeRequestService {
  final Dio dio;

  ExchangeRequestService(this.dio);

  Future<PaginatedExchangeRequestList> fetchExchangeRequests({
    int page = 1,
    int pageSize = 10,
  }) async {
    debugPrint('ExchangeRequestService: fetchExchangeRequests page=$page');
    try {
      final response = await dio.get(
        '/exchanges/',
        queryParameters: {'page': page, 'page_size': pageSize},
      );
      debugPrint('ExchangeRequestService: fetch status=${response.statusCode}');
      return PaginatedExchangeRequestList.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('ExchangeRequestService: fetch error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ExchangeRequestService: fetch unknown error=$e');
      rethrow;
    }
  }

  Future<ExchangeRequest> getExchangeRequest(int id) async {
    debugPrint('ExchangeRequestService: get id=$id');
    try {
      final response = await dio.get('/exchanges/$id/');
      debugPrint('ExchangeRequestService: get status=${response.statusCode}');
      return ExchangeRequest.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('ExchangeRequestService: get error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ExchangeRequestService: get unknown error=$e');
      rethrow;
    }
  }

  Future<ExchangeRequest> createExchangeRequest(ExchangeRequest data) async {
    debugPrint('ExchangeRequestService: create data=${data.toJson()}');
    try {
      final response = await dio.post('/exchanges/', data: data.toJson());
      debugPrint('ExchangeRequestService: create status=${response.statusCode}');
      return ExchangeRequest.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('ExchangeRequestService: create error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ExchangeRequestService: create unknown error=$e');
      rethrow;
    }
  }

  Future<ExchangeRequest> updateExchangeRequest(int id, ExchangeRequest data) async {
    debugPrint('ExchangeRequestService: update id=$id, data=${data.toJson()}');
    try {
      final response = await dio.put('/exchanges/$id/', data: data.toJson());
      debugPrint('ExchangeRequestService: update status=${response.statusCode}');
      return ExchangeRequest.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('ExchangeRequestService: update error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ExchangeRequestService: update unknown error=$e');
      rethrow;
    }
  }

  Future<void> deleteExchangeRequest(int id) async {
    debugPrint('ExchangeRequestService: delete id=$id');
    try {
      final response = await dio.delete('/exchanges/$id/');
      debugPrint('ExchangeRequestService: delete status=${response.statusCode}');
    } on DioException catch (e) {
      debugPrint('ExchangeRequestService: delete error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ExchangeRequestService: delete unknown error=$e');
      rethrow;
    }
  }
}
