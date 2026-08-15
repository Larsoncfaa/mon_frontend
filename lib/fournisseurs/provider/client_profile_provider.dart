import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../../core/network/dio_provider.dart';
import '../../models/client_profile.dart';
import '../../pagination/paginated_client_profile.dart';
import '../../services/client_profile_service.dart';
import '../repositories/client_profile_repository.dart';

/// 1. Service Provider
final clientProfileServiceProvider = Provider<ClientProfileService>((ref) {
  final dio = ref.watch(dioProvider);
  return ClientProfileService(dio);
});

/// 2. Repository Provider
final clientProfileRepositoryProvider = Provider<ClientProfileRepository>((ref) {
  final service = ref.watch(clientProfileServiceProvider);
  return ClientProfileRepository(service);
});

/// Notifier pour gérer la liste paginée des profils clients (Riverpod 3.x).
class ClientProfileListNotifier extends Notifier<AsyncValue<PaginatedClientProfile>> {
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedClientProfile> build() {
    Future.microtask(() => fetchClientProfiles());
    return const AsyncLoading();
  }

  Future<void> fetchClientProfiles({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(clientProfileRepositoryProvider);
      final result = await repository.fetchClientProfiles(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
      debugPrint('Erreur fetchClientProfiles: $e');
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchClientProfiles(page: _currentPage);
  }
}

/// 3. Notifier Provider pour la liste
final clientProfileListNotifierProvider =
NotifierProvider<ClientProfileListNotifier, AsyncValue<PaginatedClientProfile>>(
  ClientProfileListNotifier.new,
);

/// Notifier pour un seul profil client (Riverpod 3.x).
class ClientProfileNotifier extends Notifier<AsyncValue<ClientProfile?>> {
  @override
  AsyncValue<ClientProfile?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> loadOrCreateProfile(int userId) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(clientProfileRepositoryProvider);
      final profile = await repository.fetchClientProfile(userId);
      state = AsyncData(profile);
    } catch (e, st) {
      if (e is DioException && e.response?.statusCode == 404) {
        try {
          final repository = ref.read(clientProfileRepositoryProvider);
          final newProfile = ClientProfile(
            id: 0,
            user: userId,
            location: "",
            balance: 0.0,
            loyaltyPoints: 0,
          );
          final created = await repository.createClientProfile(newProfile);
          state = AsyncData(created);
        } catch (e2, st2) {
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
      final repository = ref.read(clientProfileRepositoryProvider);
      final created = await repository.createClientProfile(profile);
      state = AsyncData(created);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> update(ClientProfile profile) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(clientProfileRepositoryProvider);
      final updated = await repository.updateClientProfile(profile);
      state = AsyncData(updated);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> delete(int id) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(clientProfileRepositoryProvider);
      await repository.deleteClientProfile(id);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 4. Notifier Provider pour un profil unique
final clientProfileNotifierProvider =
NotifierProvider<ClientProfileNotifier, AsyncValue<ClientProfile?>>(
  ClientProfileNotifier.new,
);
