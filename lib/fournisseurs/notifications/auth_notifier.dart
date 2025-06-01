// ============================
// 🛠 auth_notifier.dart
// ============================

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/auth_state.dart';
import '../../models/user.dart';
import '../repositories/auth_repository.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  /// Initialise l'état à `data(null)` (utilisateur non connecté)
  AuthNotifier(this._repository) : super(const AuthState.data(null));

  /// Inscription
  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    final success = await _repository.register(
      firstName: firstName,
      lastName:  lastName,
      email:     email,
      password:  password,
    );
    if (success) {
      state = const AuthState.data(null);
    } else {
      state = const AuthState.error('Inscription échouée');
    }
    return success;
  }

  /// Connexion
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    final success = await _repository.login(
      email:    email,
      password: password,
    );
    if (success) {
      final User user = await _repository.getCurrentUser();
      state = AuthState.data(user);
    } else {
      state = const AuthState.error('Connexion échouée');
    }
    return success;
  }

  /// Déconnexion
  Future<void> logout() async {
    state = const AuthState.loading();
    await _repository.logout();
    state = const AuthState.data(null);
  }

  /// Vérification de token (token passé en paramètre)
  Future<void> verifyToken(String token) async {
    state = const AuthState.loading();
    final bool valid = await _repository.verifyToken(token);
    if (valid) {
      final User user = await _repository.getCurrentUser();
      state = AuthState.data(user);
    } else {
      state = const AuthState.data(null);
    }
  }
}
