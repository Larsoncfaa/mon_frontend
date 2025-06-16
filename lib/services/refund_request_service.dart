import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/refund_request.dart';

/// Service de gestion des demandes de remboursement.
/// Utilise Dio pour communiquer avec l'API backend.
class RefundRequestService {
  final Dio dio;

  RefundRequestService(this.dio);

  /// Récupère toutes les demandes de remboursement via `/refunds/`
  /// en extrayant la clé `results` du JSON paginé.
  Future<List<RefundRequest>> getAll() async {
    debugPrint('RefundRequestService: getAll');
    try {
      final response = await dio.get('/refunds/');
      debugPrint('RefundRequestService: getAll status=${response.statusCode}');

      final results = response.data['results'] as List;
      return results
          .map((json) => RefundRequest.fromJson(json))
          .toList();
    } on DioException catch (e) {
      debugPrint('RefundRequestService: getAll error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('RefundRequestService: getAll unknown error=$e');
      rethrow;
    }
  }

  /// Récupère une demande de remboursement par ID.
  Future<RefundRequest> get(int id) async {
    debugPrint('RefundRequestService: get id=$id');
    try {
      final response = await dio.get('/refunds/$id/');
      debugPrint('RefundRequestService: get status=${response.statusCode}');
      return RefundRequest.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('RefundRequestService: get error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('RefundRequestService: get unknown error=$e');
      rethrow;
    }
  }

  /// Crée une nouvelle demande de remboursement.
  Future<RefundRequest> create(RefundRequest data) async {
    debugPrint('RefundRequestService: create data=${data.toJson()}');
    try {
      final response = await dio.post('/refunds/', data: data.toJson());
      debugPrint('RefundRequestService: create status=${response.statusCode}');
      return RefundRequest.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('RefundRequestService: create error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('RefundRequestService: create unknown error=$e');
      rethrow;
    }
  }

  /// Met à jour une demande de remboursement existante.
  Future<RefundRequest> update(int id, RefundRequest data) async {
    debugPrint('RefundRequestService: update id=$id, data=${data.toJson()}');
    try {
      final response = await dio.put('/refunds/$id/', data: data.toJson());
      debugPrint('RefundRequestService: update status=${response.statusCode}');
      return RefundRequest.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('RefundRequestService: update error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('RefundRequestService: update unknown error=$e');
      rethrow;
    }
  }

  /// Supprime une demande de remboursement par ID.
  Future<void> delete(int id) async {
    debugPrint('RefundRequestService: delete id=$id');
    try {
      final response = await dio.delete('/refunds/$id/');
      debugPrint('RefundRequestService: delete status=${response.statusCode}');
    } on DioException catch (e) {
      debugPrint('RefundRequestService: delete error=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('RefundRequestService: delete unknown error=$e');
      rethrow;
    }
  }
}
