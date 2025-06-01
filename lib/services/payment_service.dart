import 'package:dio/dio.dart';
import '../models/payment.dart';

class PaymentService {
  final Dio _dio;

  PaymentService(this._dio);

  /// Récupère un paiement par ID
  Future<Payment> fetchPayment(int id) async {
    final response = await _dio.get('/v1/payments/$id/');
    return Payment.fromJson(response.data);
  }

  /// Crée un nouveau paiement
  Future<Payment> createPayment(Payment payment) async {
    final response = await _dio.post(
      '/v1/payments/',
      data: payment.toJson(),
    );
    return Payment.fromJson(response.data);
  }

  /// Met à jour un paiement existant
  Future<Payment> updatePayment(int id, Payment payment) async {
    final response = await _dio.put(
      '/v1/payments/$id/',
      data: payment.toJson(),
    );
    return Payment.fromJson(response.data);
  }

  /// Supprime un paiement
  Future<void> deletePayment(int id) async {
    await _dio.delete('/v1/payments/$id/');
  }
}
