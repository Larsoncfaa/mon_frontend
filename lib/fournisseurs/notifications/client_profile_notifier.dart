import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/client_profile.dart';
import '../../pagination/paginated_client_profile.dart';
import '../repositories/client_profile_repository.dart';

// Provider du repository (à adapter selon ton projet)
final clientProfileRepositoryProvider = Provider<ClientProfileRepository>((ref) {
  throw UnimplementedError('Initialisez votre ClientProfileRepository ici');
});

/// Notifier pour gérer la liste paginée des profils clients (Riverpod 3.x).
class ClientProfileListNotifier extends Notifier<AsyncValue<PaginatedClientProfile>> {
  late final ClientProfileRepository _repository;
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedClientProfile> build() {
    _repository = ref.watch(clientProfileRepositoryProvider);
    fetchClientProfiles();
    return const AsyncLoading();
  }

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

/// Provider pour la liste paginée des profils clients
final clientProfileListNotifierProvider =
NotifierProvider<ClientProfileListNotifier, AsyncValue<PaginatedClientProfile>>(
  ClientProfileListNotifier.new,
);

/// Notifier pour un seul profil client (Riverpod 3.x).
class ClientProfileNotifier extends Notifier<AsyncValue<ClientProfile?>> {
  late final ClientProfileRepository _repository;

  @override
  AsyncValue<ClientProfile?> build() {
    _repository = ref.watch(clientProfileRepositoryProvider);
    return const AsyncValue.data(null);
  }

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
            id: 0,
            user: userId,
            location: "",
            balance: 0.0,
            loyaltyPoints: 0,
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

/// Provider pour un profil client unique
final clientProfileNotifierProvider =
NotifierProvider<ClientProfileNotifier, AsyncValue<ClientProfile?>>(
  ClientProfileNotifier.new,
);