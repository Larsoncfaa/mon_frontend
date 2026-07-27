import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maliag/core/network/dio_provider.dart';

import '../../models/user.dart';
import '../../models/user_role.dart';
import '../../services/auth_service.dart';
import '../repositories/auth_repository.dart';

/// Provider pour le AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRepository(AuthService(dio), const FlutterSecureStorage());
});

/// Notifier moderne pour Riverpod 3.x
class AuthNotifier extends Notifier<AsyncValue<User?>> {
  late final AuthRepository _authRepository;

  @override
  AsyncValue<User?> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _loadUser();
    return const AsyncValue.loading();
  }

  Future<void> _loadUser() async {
    try {
      final user = await _authRepository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (e) {
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
      final result = await _authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        role: role,
      );

      if (result != null && result['user'] != null) {
        final user = User.fromJson(result['user'] as Map<String, dynamic>);
        state = AsyncValue.data(user);
        return true;
      } else {
        state = const AsyncValue.data(null);
        return false;
      }
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
      } else {
        state = const AsyncValue.data(null);
        return false;
      }
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

/// Provider du AuthNotifier (compatible v3)
final authNotifierProvider =
NotifierProvider<AuthNotifier, AsyncValue<User?>>(AuthNotifier.new);