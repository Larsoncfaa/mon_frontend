import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user.dart';
import '../models/user_role.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  /// INSCRIPTION
  Future<Response> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required UserRole role,
    String? phone,
    String? location,
  }) {
    final data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email.trim().toLowerCase(),
      'password': password,
      'role': role.name,
      'phone': phone,
      'location': location,
    };

    debugPrint(
      '[AuthService] INSCRIPTION',
    );

    debugPrint(
      '[AuthService] Données envoyées: $data',
    );

    return _dio.post(
      '/auth/register/',
      data: data,
    );
  }

  /// CONNEXION
  Future<Response> login({
    required String login,
    required String password,
  }) {
    debugPrint(
      '[AuthService] Connexion: $login',
    );

    return _dio.post(
      '/auth/login/',
      data: {
        'login': login,
        'password': password,
      },
    );
  }

  /// DÉCONNEXION
  Future<Response> logout({
    required String refreshToken,
  }) async {
    final storage =
    const FlutterSecureStorage();

    final storedToken =
    await storage.read(
      key: 'refresh_token',
    );

    if (storedToken == null) {
      throw Exception(
        'Refresh token introuvable',
      );
    }

    return _dio.post(
      '/auth/logout/',
      data: {
        'refresh': storedToken,
      },
    );
  }

  /// PROFIL UTILISATEUR
  Future<User> getCurrentUser() async {
    final response =
    await _dio.get('/profile/');

    return User.fromJson(
      response.data,
    );
  }

  /// VÉRIFICATION TOKEN
  Future<Response> verifyToken(
      String token,
      ) {
    return _dio.post(
      '/auth/token/verify/',
      data: {
        'token': token,
      },
    );
  }
}