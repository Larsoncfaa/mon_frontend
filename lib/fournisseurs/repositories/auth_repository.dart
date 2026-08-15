import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/user.dart';
import '../../models/user_role.dart';
import '../../services/auth_service.dart';

class AuthRepository {
  final AuthService _service;
  final FlutterSecureStorage _storage;

  AuthRepository(
      this._service,
      this._storage,
      );

  /// INSCRIPTION
  Future<Map<String, dynamic>?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required UserRole role,
    String? phone,
    String? location,
  }) async {
    try {
      final response = await _service.register(
        firstName: firstName,
        lastName: lastName,
        email: email.trim().toLowerCase(),
        password: password,
        role: role,
        phone: phone,
        location: location,
      );

      if (response.statusCode != 201) {
        return null;
      }

      final data =
      response.data as Map<String, dynamic>;

      final access = data['access'] as String?;
      final refresh = data['refresh'] as String?;

      final userData =
      data['user'] as Map<String, dynamic>?;

      if (access == null ||
          refresh == null ||
          userData == null) {
        return null;
      }

      await _storage.write(
        key: 'access_token',
        value: access,
      );

      await _storage.write(
        key: 'refresh_token',
        value: refresh,
      );

      return {
        'access': access,
        'refresh': refresh,
        'user': userData,
      };
    } on DioException catch (e) {
      print(
        '[AuthRepository] Erreur inscription: '
            '${e.response?.data}',
      );

      rethrow;
    } catch (e) {
      print(
        '[AuthRepository] Erreur inconnue: $e',
      );

      rethrow;
    }
  }

  /// CONNEXION
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _service.login(
        login: email.trim().toLowerCase(),
        password: password,
      );

      if (response.statusCode != 200) {
        return false;
      }

      final data =
      response.data as Map<String, dynamic>;

      final access = data['access'] as String?;
      final refresh = data['refresh'] as String?;

      if (access == null || refresh == null) {
        return false;
      }

      await _storage.write(
        key: 'access_token',
        value: access,
      );

      await _storage.write(
        key: 'refresh_token',
        value: refresh,
      );

      return true;
    } on DioException catch (e) {
      print(
        '[AuthRepository] Erreur connexion: '
            '${e.response?.data}',
      );

      rethrow;
    }
  }

  /// DÉCONNEXION
  Future<void> logout() async {
    try {
      final refresh =
      await _storage.read(
        key: 'refresh_token',
      );

      await _storage.delete(
        key: 'access_token',
      );

      await _storage.delete(
        key: 'refresh_token',
      );

      if (refresh != null) {
        await _service.logout(
          refreshToken: refresh,
        );
      }
    } catch (e) {
      print(
        '[AuthRepository] Erreur logout: $e',
      );
    }
  }

  /// PROFIL
  Future<User> getCurrentUser() {
    return _service.getCurrentUser();
  }

  /// VÉRIFICATION TOKEN
  Future<bool> verifyToken(String token) async {
    try {
      final response =
      await _service.verifyToken(token);

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}