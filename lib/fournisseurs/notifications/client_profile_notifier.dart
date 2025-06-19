import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/client_profile.dart';
import '../../pagination/paginated_client_profile.dart';
import '../repositories/client_profile_repository.dart';

/// StateNotifier pour gérer la liste paginée des profils clients.
class ClientProfileListNotifier extends StateNotifier<AsyncValue<PaginatedClientProfile>> {
  final ClientProfileRepository _repository;

  ClientProfileListNotifier(this._repository) : super(const AsyncLoading()) {
    fetchClientProfiles();
  }

  int _currentPage = 1;

  Future<void> fetchClientProfiles({int page = 1}) async {
    state = const AsyncLoading();
    try {
      debugPrint('ClientProfileListNotifier: fetchClientProfiles page $page');
      final result = await _repository.fetchClientProfiles(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
      debugPrint('Erreur fetchClientProfiles: $e');
      debugPrint(st.toString());
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchClientProfiles(page: _currentPage);
  }
}

/// StateNotifier pour un seul profil client (utilisé pour affichage, édition, suppression).
class ClientProfileNotifier extends StateNotifier<AsyncValue<ClientProfile?>> {
  final ClientProfileRepository _repository;

  ClientProfileNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> loadOrCreateProfile(int userId) async {
    state = const AsyncLoading();
    try {
      debugPrint('ClientProfileNotifier: tentative de chargement du profil client');
      final profile = await _repository.fetchClientProfile(userId);
      state = AsyncData(profile);
    } catch (e, st) {
      debugPrint('Profil introuvable, tentative de création...');
      // Si le backend renvoie 404, on crée un profil vide par défaut
      if (e is DioException && e.response?.statusCode == 404) {
        try {
          final newProfile = ClientProfile(
            id: 0, // sera ignoré par le backend
            user: userId,
            location: null,
            balance: 0.0,
            points: 0,
          );
          final created = await _repository.createClientProfile(newProfile);
          state = AsyncData(created);
        } catch (e2, st2) {
          debugPrint('Erreur lors de la création du profil: $e2');
          state = AsyncError(e2, st2);
        }
      } else {
        state = AsyncError(e, st);
      }
    }
  }

  Future<void> create(ClientProfile profile) async {
    state = const AsyncLoading();
    try {
      debugPrint('ClientProfileNotifier: create profile');
      final created = await _repository.createClientProfile(profile);
      state = AsyncData(created);
    } catch (e, st) {
      debugPrint('Erreur create: $e');
      debugPrint(st.toString());
      state = AsyncError(e, st);
    }
  }

  Future<void> update(ClientProfile profile) async {
    state = const AsyncLoading();
    try {
      debugPrint('ClientProfileNotifier: update profile id ${profile.id}');
      final updated = await _repository.updateClientProfile(profile);
      state = AsyncData(updated);
    } catch (e, st) {
      debugPrint('Erreur update: $e');
      debugPrint(st.toString());
      state = AsyncError(e, st);
    }
  }

  Future<void> delete(int id) async {
    state = const AsyncLoading();
    try {
      debugPrint('ClientProfileNotifier: delete profile id $id');
      await _repository.deleteClientProfile(id);
      state = const AsyncData(null);
    } catch (e, st) {
      debugPrint('Erreur delete: $e');
      debugPrint(st.toString());
      state = AsyncError(e, st);
    }
  }
}
