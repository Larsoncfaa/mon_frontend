



import '../../models/client_profile.dart';
import '../../pagination/paginated_client_profile.dart';
import '../../services/client_profile_service.dart';

/// Repository pour encapsuler la logique métier liée aux profils clients.
class ClientProfileRepository {
  final ClientProfileService _service;

  ClientProfileRepository(this._service);

  /// Récupère une page de profils clients.
  Future<PaginatedClientProfile> fetchClientProfiles({int page = 1}) {
    return _service.getClientProfiles(page: page);
  }

  /// Récupère un profil client par son ID.
  Future<ClientProfile> fetchClientProfile(int id) {
    return _service.getClientProfile(id);
  }

  /// Crée un nouveau profil client.
  Future<ClientProfile> createClientProfile(ClientProfile profile) {
    return _service.createClientProfile(profile);
  }

  /// Met à jour un profil client.
  Future<ClientProfile> updateClientProfile(ClientProfile profile) {
    return _service.updateClientProfile(profile);
  }

  /// Supprime un profil client par ID.
  Future<void> deleteClientProfile(int id) {
    return _service.deleteClientProfile(id);
  }
}
