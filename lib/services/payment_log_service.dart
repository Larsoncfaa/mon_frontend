import 'package:dio/dio.dart';
import '../models/payment_log.dart';
import '../pagination/paginated_payment_log_list.dart';


class PaymentLogService {
  final Dio _dio;

  PaymentLogService(this._dio);

  Future<PaginatedPaymentLogList> fetchAll({int page = 1}) async {
    final response = await _dio.get('/v1/payment-logs/', queryParameters: {'page': page});
    return PaginatedPaymentLogList.fromJson(response.data);
  }

  Future<PaymentLog> fetchById(int id) async {
    final response = await _dio.get('/v1/payment-logs/$id/');
    return PaymentLog.fromJson(response.data);
  }

  Future<PaymentLog> create(PaymentLog log) async {
    final response = await _dio.post('/v1/payment-logs/', data: log.toJson());
    return PaymentLog.fromJson(response.data);
  }

  Future<PaymentLog> update(int id, PaymentLog log) async {
    final response = await _dio.put('/v1/payment-logs/$id/', data: log.toJson());
    return PaymentLog.fromJson(response.data);
  }

  Future<void> delete(int id) async {
    await _dio.delete('/v1/payment-logs/$id/');
  }
}
