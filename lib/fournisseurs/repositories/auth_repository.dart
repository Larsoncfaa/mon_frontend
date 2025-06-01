import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/user.dart';
import '../../services/auth_service.dart';


class AuthRepository {
  final AuthService _service;
  AuthRepository(this._service);

  /// Retourne true si l'inscription réussit (201 Created)
  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final Response resp = await _service.register(
        firstName: firstName,
        lastName:  lastName,
        email:     email,
        password:  password,
      );
      return resp.statusCode == 201;
    } on DioException {
      // Vous pouvez logger e.response?.data si besoin
      return false;
    }
  }

  /// Retourne true si la connexion réussit (200 OK)
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response resp = await _service.login(
        email: email,
        password: password,
      );

      if (resp.statusCode == 200) {
        final data = resp.data;
        final access = data['access'];
        final refresh = data['refresh'];

        if (access != null && refresh != null) {
          var storage = FlutterSecureStorage();
          await storage.write(key: 'access_token', value: access);
          await storage.write(key: 'refresh_token', value: refresh);
          return true;
        }
      }
      return false;
    } on DioException catch (e) {
      print('[AuthRepository] Login failed: ${e.response?.data}');
      return false;
    }
  }

  Future<void> logout() => _service.logout();

  Future<bool> verifyToken(String token) => _service.verifyToken(token);

  Future<User> getCurrentUser() => _service.getCurrentUser();

// Ajoutez ici les wrappers pour resetPassword, setPassword, etc.
}
