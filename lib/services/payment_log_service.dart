import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // pour debugPrint
import '../models/payment_log.dart';
import '../pagination/paginated_payment_log_list.dart';

class PaymentLogService {
  final Dio _dio;

  PaymentLogService(this._dio);

  Future<PaginatedPaymentLogList> fetchAll({int page = 1}) async {
    try {
      final response = await _dio.get('/payment-logs/', queryParameters: {'page': page});
      debugPrint('✔️ Payment logs page $page fetched');
      return PaginatedPaymentLogList.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      debugPrint('❌ Erreur lors du chargement des paiements : ${e.message}');
      log('fetchAll payment logs failed', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PaymentLog> fetchById(int id) async {
    try {
      final response = await _dio.get('/payment-logs/$id/');
      debugPrint('✔️ Payment log $id fetched');
      return PaymentLog.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      debugPrint('❌ Erreur lors de la récupération du paiement $id : ${e.message}');
      log('fetchById failed for $id', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PaymentLog> create(PaymentLog logData) async {
    try {
      final response = await _dio.post('/payment-logs/', data: logData.toJson());
      debugPrint('✔️ Payment log created');
      return PaymentLog.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      debugPrint('❌ Erreur lors de la création d\'un paiement : ${e.message}');
      log('create payment log failed', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<PaymentLog> update(int id, PaymentLog logData) async {
    try {
      final response = await _dio.put('/payment-logs/$id/', data: logData.toJson());
      debugPrint('✔️ Payment log $id updated');
      return PaymentLog.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      debugPrint('❌ Erreur lors de la mise à jour du paiement $id : ${e.message}');
      log('update payment log $id failed', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      await _dio.delete('/payment-logs/$id/');
      debugPrint('🗑️ Payment log $id deleted');
    } on DioException catch (e, stackTrace) {
      debugPrint('❌ Erreur lors de la suppression du paiement $id : ${e.message}');
      log('delete payment log $id failed', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
