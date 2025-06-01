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
      final result = await _repository.fetchClientProfiles(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
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

  Future<void> loadProfile(int id) async {
    state = const AsyncLoading();
    try {
      final profile = await _repository.fetchClientProfile(id);
      state = AsyncData(profile);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> create(ClientProfile profile) async {
    state = const AsyncLoading();
    try {
      final created = await _repository.createClientProfile(profile);
      state = AsyncData(created);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> update(ClientProfile profile) async {
    state = const AsyncLoading();
    try {
      final updated = await _repository.updateClientProfile(profile);
      state = AsyncData(updated);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> delete(int id) async {
    state = const AsyncLoading();
    try {
      await _repository.deleteClientProfile(id);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
