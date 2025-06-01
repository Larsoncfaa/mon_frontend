// 📦 FICHIER : lib/services/delivery_person_service.dart

import 'package:dio/dio.dart';
import '../models/delivery_person.dart';


class DeliveryPersonService {
  final Dio _dio;
  DeliveryPersonService(this._dio);

  /// Récupère une page de livraisons. Si [url] est fourni, l'utilise directement,
  /// sinon utilise '/delivery-persons/'.
  Future<PaginatedDeliveryPersonList> fetchPage({String? url}) async {
    final response = await _dio.get(url ?? '/v1/livreurs/');
    return PaginatedDeliveryPersonList.fromJson(response.data as Map<String, dynamic>);
  }

  /// Met à jour le statut d'une livraison à 'delivered'.
  Future<DeliveryPerson> markDelivered(int id) async {
    final response = await _dio.patch(
      '/delivery-persons/\$id/',
      data: {'status': 'delivered'},
    );
    return DeliveryPerson.fromJson(response.data as Map<String, dynamic>);
  }

  /// Réassigne une livraison à un autre livreur
  Future<DeliveryPerson> reassign(int id, int newUserId) async {
    final response = await _dio.patch(
      '/delivery-persons/$id/',
      data: {'user': newUserId},
    );
    return DeliveryPerson.fromJson(response.data as Map<String, dynamic>);
  }
}

