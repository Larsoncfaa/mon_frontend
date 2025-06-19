import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/delivery_person.dart';
import '../pagination/paginated_delivery_person_list.dart';

class DeliveryPersonService {
  final Dio _dio;

  DeliveryPersonService(this._dio);

  /// 🔄 Récupère une page de livreurs
  Future<PaginatedDeliveryPersonList> fetchPage({String? url}) async {
    try {
      final response = await _dio.get(url ?? '/livreurs/');
      debugPrint('✅ fetchPage: ${response.statusCode}');
      return PaginatedDeliveryPersonList.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      debugPrint('❌ Erreur fetchPage: $e');
      rethrow;
    }
  }

  /// 📦 Marque un livreur comme ayant livré (à adapter si besoin)
  Future<DeliveryPerson> markDelivered(int id) async {
    try {
      final response = await _dio.patch(
        '/delivery-persons/$id/',
        data: {'status': 'delivered'}, // Note: Assure-toi que ce champ est accepté par l'API
      );
      debugPrint('✅ markDelivered $id: ${response.statusCode}');
      return DeliveryPerson.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      debugPrint('❌ Erreur markDelivered $id: $e');
      rethrow;
    }
  }

  /// 🔁 Réassigne un livreur à un autre utilisateur
  Future<DeliveryPerson> reassign(int id, int newUserId) async {
    try {
      final response = await _dio.patch(
        '/delivery-persons/$id/',
        data: {'user': newUserId},
      );
      debugPrint('✅ reassign $id -> $newUserId: ${response.statusCode}');
      return DeliveryPerson.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      debugPrint('❌ Erreur reassign $id: $e');
      rethrow;
    }
  }
  Future<void> createDeliveryPerson(Map<String, dynamic> data) async {
    try {
      await _dio.post('/delivery-persons/', data: data);
    } catch (e, st) {
      debugPrint('Erreur création livreur : $e');
      rethrow;
    }
  }
  // 🆕 🔥 Ajoute cette méthode :
  Future<void> delete(int id) async {
    try {
      await _dio.delete('/delivery-persons/$id/');
      debugPrint('✅ [Service] Livreur $id supprimé');
    } catch (e) {
      debugPrint('❌ [Service] Erreur lors de la suppression du livreur $id : $e');
      rethrow;
    }
  }
}
