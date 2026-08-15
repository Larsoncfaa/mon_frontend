import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:maliag/core/network/dio_provider.dart';

import '../../models/user.dart';
import '../../models/user_role.dart';
import '../../services/auth_service.dart';
import '../repositories/auth_repository.dart';

/// Service d'authentification
final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.read(dioProvider);
  return AuthService(dio);
});

/// Repository d'authentification
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final service = ref.watch(authServiceProvider);

  return AuthRepository(
    service,
    const FlutterSecureStorage(),
  );
});

/// Gestionnaire de l'authentification
class AuthNotifier extends Notifier<AsyncValue<User?>> {
  late final AuthRepository _authRepository;

  @override
  AsyncValue<User?> build() {
    _authRepository = ref.watch(authRepositoryProvider);

    _loadUser();

    return const AsyncValue.loading();
  }

  /// Charge l'utilisateur connecté
  Future<void> _loadUser() async {
    try {
      const storage = FlutterSecureStorage();

      final token = await storage.read(
        key: 'access_token',
      );

      if (token == null || token.isEmpty) {
        state = const AsyncValue.data(null);
        return;
      }

      final user = await _authRepository.getCurrentUser();

      state = AsyncValue.data(user);
    } catch (e) {
      state = const AsyncValue.data(null);
    }
  }

  /// INSCRIPTION
  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required UserRole role,
    String? phone,
    String? location,
  }) async {
    state = const AsyncValue.loading();

    try {
      final result = await _authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        role: role,
        phone: phone,
        location: location,
      );

      if (result != null && result['user'] != null) {
        final userData =
        result['user'] as Map<String, dynamic>;

        final user = User.fromJson(userData);

        state = AsyncValue.data(user);

        return true;
      }

      state = const AsyncValue.data(null);

      return false;
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        e,
        stackTrace,
      );

      return false;
    }
  }

  /// CONNEXION
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    try {
      final success = await _authRepository.login(
        email: email,
        password: password,
      );

      if (!success) {
        state = const AsyncValue.data(null);
        return false;
      }

      final user = await _authRepository.getCurrentUser();

      state = AsyncValue.data(user);

      return true;
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        e,
        stackTrace,
      );

      return false;
    }
  }

  /// DÉCONNEXION
  Future<void> logout() async {
    state = const AsyncValue.loading();

    await _authRepository.logout();

    state = const AsyncValue.data(null);
  }
}

/// Provider global
final authNotifierProvider =
NotifierProvider<AuthNotifier, AsyncValue<User?>>(
  AuthNotifier.new,
);