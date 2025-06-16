import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/user.dart';
import '../../models/user_role.dart';
import '../../services/auth_service.dart';

class AuthRepository {
  final AuthService _service;
  final FlutterSecureStorage _storage;

  AuthRepository(this._service, this._storage);

  /// Inscription — retourne directement les données de l’utilisateur
  Future<Map<String, dynamic>?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required UserRole? role,
  }) async {
    try {
      final resp = await _service.register(
        firstName: firstName,
        lastName: lastName,
        email: email.trim().toLowerCase(),
        password: password,
        role: role!,
      );

      if (resp.statusCode == 201) {
        final data = resp.data as Map<String, dynamic>;

        final access = data['access'] as String?;
        final refresh = data['refresh'] as String?;
        final userData = data['user'] as Map<String, dynamic>?;

        if (access != null && refresh != null && userData != null) {
          // Stocke les tokens localement
          await _storage.write(key: 'access_token', value: access);
          await _storage.write(key: 'refresh_token', value: refresh);

          // Retourne toutes les données utiles
          return {
            'access': access,
            'refresh': refresh,
            'user': userData,
          };
        }
      }

      return null;
    } on DioException catch (e) {
      print('[AuthRepository] Échec d\'inscription : ${e.response?.data}');
      return null;
    }
  }

  /// Connexion
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final resp = await _service.login(
        login: email.trim().toLowerCase(),
        password: password,
      );

      if (resp.statusCode == 200) {
        final data = resp.data as Map<String, dynamic>;
        final access = data['access'] as String?;
        final refresh = data['refresh'] as String?;

        if (access != null && refresh != null) {
          await _storage.write(key: 'access_token', value: access);
          await _storage.write(key: 'refresh_token', value: refresh);
          return true;
        }
      }

      return false;
    } on DioException catch (e) {
      print('[AuthRepository] Échec de connexion : ${e.response?.data}');
      return false;
    } catch (e) {
      print('[AuthRepository] Erreur inconnue : $e');
      return false;
    }
  }

  /// Déconnexion
  Future<void> logout() async {
    try {
      final refresh = await _storage.read(key: 'refresh_token');

      await _storage.delete(key: 'access_token');
      await _storage.delete(key: 'refresh_token');

      if (refresh != null) {
        await _service.logout(refreshToken: refresh);
      }
    } catch (e) {
      print('[AuthRepository] Erreur pendant la déconnexion : $e');
    }
  }

  /// Vérifie la validité d’un JWT
  Future<bool> verifyToken(String token) async {
    try {
      final resp = await _service.verifyToken(token);
      return resp.statusCode == 200;
    } on DioException catch (e) {
      print('[AuthRepository] Token invalide : ${e.response?.data}');
      return false;
    }
  }

  /// Récupère le profil utilisateur connecté
  Future<User> getCurrentUser() {
    return _service.getCurrentUser();
  }
}
