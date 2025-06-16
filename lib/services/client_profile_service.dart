import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // pour debugPrint
import '../models/client_profile.dart';
import '../pagination/paginated_client_profile.dart';

class ClientProfileService {
  final Dio _dio;

  ClientProfileService(this._dio);

  static const String baseUrl = '/clients/';

  Future<PaginatedClientProfile> getClientProfiles({int page = 1}) async {
    try {
      debugPrint('ClientProfileService: Chargement des profils clients, page $page');
      final response = await _dio.get(baseUrl, queryParameters: {'page': page});
      return PaginatedClientProfile.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('Erreur getClientProfiles: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  Future<ClientProfile> getClientProfile(int id) async {
    try {
      debugPrint('ClientProfileService: Chargement du profil client $id');
      final response = await _dio.get('$baseUrl$id/');
      return ClientProfile.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('Erreur getClientProfile $id: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  Future<ClientProfile> createClientProfile(ClientProfile profile) async {
    try {
      debugPrint('ClientProfileService: Création d\'un nouveau profil client');
      final response = await _dio.post(baseUrl, data: profile.toJson());
      return ClientProfile.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('Erreur createClientProfile: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  Future<ClientProfile> updateClientProfile(ClientProfile profile) async {
    if (profile.id == null) {
      throw ArgumentError('Le profil doit avoir un id pour être mis à jour.');
    }
    try {
      debugPrint('ClientProfileService: Mise à jour du profil client ${profile.id}');
      final response = await _dio.put('$baseUrl${profile.id}/', data: profile.toJson());
      return ClientProfile.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('Erreur updateClientProfile ${profile.id}: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  Future<void> deleteClientProfile(int id) async {
    try {
      debugPrint('ClientProfileService: Suppression du profil client $id');
      await _dio.delete('$baseUrl$id/');
    } catch (e, stackTrace) {
      debugPrint('Erreur deleteClientProfile $id: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }
}
