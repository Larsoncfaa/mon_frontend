import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/payment.dart';

class PaymentService {
  final Dio _dio;

  PaymentService(this._dio);

  /// Récupère un paiement par ID
  Future<Payment> fetchPayment(int id) async {
    try {
      final response = await _dio.get('/payments/$id/');
      debugPrint('✅ Paiement récupéré: ${response.data}');
      return Payment.fromJson(response.data);
    } catch (e, st) {
      debugPrint('❌ Erreur lors de la récupération du paiement #$id: $e');
      log('Erreur fetchPayment', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// Crée un nouveau paiement
  Future<Payment> createPayment(Payment payment) async {
    try {
      final response = await _dio.post(
        '/payments/',
        data: payment.toJson(),
      );
      debugPrint('✅ Paiement créé: ${response.data}');
      return Payment.fromJson(response.data);
    } catch (e, st) {
      debugPrint('❌ Erreur lors de la création du paiement: $e');
      log('Erreur createPayment', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// Met à jour un paiement existant
  Future<Payment> updatePayment(int id, Payment payment) async {
    try {
      final response = await _dio.put(
        '/payments/$id/',
        data: payment.toJson(),
      );
      debugPrint('✅ Paiement mis à jour: ${response.data}');
      return Payment.fromJson(response.data);
    } catch (e, st) {
      debugPrint('❌ Erreur lors de la mise à jour du paiement #$id: $e');
      log('Erreur updatePayment', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// Supprime un paiement
  Future<void> deletePayment(int id) async {
    try {
      await _dio.delete('/payments/$id/');
      debugPrint('✅ Paiement supprimé: ID $id');
    } catch (e, st) {
      debugPrint('❌ Erreur lors de la suppression du paiement #$id: $e');
      log('Erreur deletePayment', error: e, stackTrace: st);
      rethrow;
    }
  }
}
