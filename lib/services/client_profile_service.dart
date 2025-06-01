import 'package:dio/dio.dart';
import '../models/client_profile.dart';
import '../pagination/paginated_client_profile.dart';


/// Service Dio pour interagir avec les endpoints liés aux clients.
class ClientProfileService {
  final Dio _dio;

  ClientProfileService(this._dio);

  static const String baseUrl = '/v1/clients/';

  /// Récupère une liste paginée de profils clients.
  Future<PaginatedClientProfile> getClientProfiles({int page = 1}) async {
    final response = await _dio.get(baseUrl, queryParameters: {'page': page});
    return PaginatedClientProfile.fromJson(response.data);
  }

  /// Récupère un profil client spécifique par son [id].
  Future<ClientProfile> getClientProfile(int id) async {
    final response = await _dio.get('$baseUrl$id/');
    return ClientProfile.fromJson(response.data);
  }

  /// Crée un nouveau profil client.
  Future<ClientProfile> createClientProfile(ClientProfile profile) async {
    final response = await _dio.post(baseUrl, data: profile.toJson());
    return ClientProfile.fromJson(response.data);
  }

  /// Met à jour un profil client existant.
  Future<ClientProfile> updateClientProfile(ClientProfile profile) async {
    final response = await _dio.put('$baseUrl${profile.id}/', data: profile.toJson());
    return ClientProfile.fromJson(response.data);
  }

  /// Supprime un profil client existant.
  Future<void> deleteClientProfile(int id) async {
    await _dio.delete('$baseUrl$id/');
  }
}
