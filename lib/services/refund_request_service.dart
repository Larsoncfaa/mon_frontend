// services/refund_request_service.dart

import 'package:dio/dio.dart';
import '../models/refund_request.dart';

class RefundRequestService {
  final Dio dio;

  RefundRequestService(this.dio);

  Future<List<RefundRequest>> getAll() async {
    final response = await dio.get('/v1/refunds/');
    return (response.data as List)
        .map((json) => RefundRequest.fromJson(json))
        .toList();
  }

  Future<RefundRequest> get(int id) async {
    final response = await dio.get('/v1/refunds/$id/');
    return RefundRequest.fromJson(response.data);
  }

  Future<RefundRequest> create(RefundRequest data) async {
    final response = await dio.post('/v1/refunds/', data: data.toJson());
    return RefundRequest.fromJson(response.data);
  }

  Future<RefundRequest> update(int id, RefundRequest data) async {
    final response = await dio.put('/v1/refunds/$id/', data: data.toJson());
    return RefundRequest.fromJson(response.data);
  }

  Future<void> delete(int id) async {
    await dio.delete('/v1/refunds/$id/');
  }
}
