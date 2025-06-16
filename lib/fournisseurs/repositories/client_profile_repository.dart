import 'package:flutter/foundation.dart';
import '../../models/client_profile.dart';
import '../../pagination/paginated_client_profile.dart';
import '../../services/client_profile_service.dart';

/// Repository pour encapsuler la logique métier liée aux profils clients.
class ClientProfileRepository {
  final ClientProfileService _service;

  ClientProfileRepository(this._service);

  /// Récupère une page de profils clients.
  Future<PaginatedClientProfile> fetchClientProfiles({int page = 1}) async {
    try {
      debugPrint('ClientProfileRepository: fetchClientProfiles page $page');
      return await _service.getClientProfiles(page: page);
    } catch (e, stackTrace) {
      debugPrint('Erreur fetchClientProfiles: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  /// Récupère un profil client par son ID.
  Future<ClientProfile> fetchClientProfile(int id) async {
    try {
      debugPrint('ClientProfileRepository: fetchClientProfile $id');
      return await _service.getClientProfile(id);
    } catch (e, stackTrace) {
      debugPrint('Erreur fetchClientProfile $id: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  /// Crée un nouveau profil client.
  Future<ClientProfile> createClientProfile(ClientProfile profile) async {
    try {
      debugPrint('ClientProfileRepository: createClientProfile');
      return await _service.createClientProfile(profile);
    } catch (e, stackTrace) {
      debugPrint('Erreur createClientProfile: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  /// Met à jour un profil client.
  Future<ClientProfile> updateClientProfile(ClientProfile profile) async {
    try {
      debugPrint('ClientProfileRepository: updateClientProfile ${profile.id}');
      return await _service.updateClientProfile(profile);
    } catch (e, stackTrace) {
      debugPrint('Erreur updateClientProfile ${profile.id}: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  /// Supprime un profil client par ID.
  Future<void> deleteClientProfile(int id) async {
    try {
      debugPrint('ClientProfileRepository: deleteClientProfile $id');
      await _service.deleteClientProfile(id);
    } catch (e, stackTrace) {
      debugPrint('Erreur deleteClientProfile $id: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }
}
