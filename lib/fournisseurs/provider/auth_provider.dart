import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maliag/core/network/dio_provider.dart';


import '../../models/user.dart';
import '../../models/user_role.dart';
import '../../services/auth_service.dart';
import '../repositories/auth_repository.dart';

/// Fournisseur du service d'authentification
final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.read(dioProvider); // ✅ lire le Dio correctement
  return AuthService(dio);
});

/// Fournisseur du repository d'authentification
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthRepository(authService, const FlutterSecureStorage());
});

/// StateNotifier pour gérer l'état d'authentification
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AsyncValue.loading()) {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    try {
      final user = await _authRepository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (_) {
      state = const AsyncValue.data(null);
    }
  }

  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required UserRole role,
  }) async {
    state = const AsyncLoading();

    try {
      final user = await _authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        role: role,
      );

      if (user != null) {
        state = AsyncValue.data(user as User?);
        return true;
      }

      state = const AsyncValue.data(null);
      return false;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final success = await _authRepository.login(
        email: email,
        password: password,
      );

      if (success) {
        final user = await _authRepository.getCurrentUser();
        state = AsyncValue.data(user);
        return true;
      }

      state = const AsyncValue.data(null);
      return false;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await _authRepository.logout();
    state = const AsyncValue.data(null);
  }
}

/// Fournisseur global du AuthNotifier
final authNotifierProvider =
StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});
