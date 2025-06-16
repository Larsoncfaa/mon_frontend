import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user.dart';
import '../models/user_role.dart';

class AuthService {
  final Dio _dio;
  AuthService(this._dio);

  /// Inscription
  Future<Response> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required UserRole role,
  }) {
    debugPrint('[AuthService] Registering user: $email, Role: ${role.name}');

    final data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email.toLowerCase().trim(),
      'password': password,
      'role': role.name,
    };

    debugPrint('[AuthService] Data sent to API: $data');

    return _dio.post(
      '/auth/register/',
      data: data,
    );
  }

  /// Connexion
  Future<Response> login({
    required String login,
    required String password,
  }) {
    debugPrint('[AuthService] Attempting login for: $login');
    return _dio.post(
      '/auth/login/',
      data: {
        'login': login,
        'password': password,
      },
    );
  }

  /// Déconnexion
  Future<Response> logout({required String refreshToken}) async {
    debugPrint('[AuthService] Logging out with refreshToken: $refreshToken');

    final storage = FlutterSecureStorage();
    final storedRefreshToken = await storage.read(key: 'refresh_token');

    if (storedRefreshToken != null) {
      return _dio.post(
        '/auth/logout/',
        data: {'refresh': storedRefreshToken},
      );
    } else {
      debugPrint('[AuthService] No refresh token found in storage.');
      return Future.error('No refresh token found');
    }
  }

  /// Récupérer le profil courant
  Future<User> getCurrentUser() async {
    debugPrint('[AuthService] Fetching current user profile');
    final resp = await _dio.get('/profile/');
    return User.fromJson(resp.data);
  }

  /// Vérifier un token (JWT)
  Future<Response> verifyToken(String token) {
    debugPrint('[AuthService] Verifying token: $token');
    return _dio.post(
      '/auth/token/verify/',
      data: {'token': token},
    );
  }
}
