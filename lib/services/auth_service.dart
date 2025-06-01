import 'package:dio/dio.dart';
import '../models/user.dart';
import '../models/username_reset_confirm.dart';
import '../models/send_email_reset.dart';
import '../models/set_password.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  /// Appelle l'API d'inscription avec first_name et last_name
  Future<Response> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return _dio.post(
      '/v1/auth/register/',
      data: {
        'first_name': firstName,
        'last_name':  lastName,
        'email':      email,
        'password':   password,
      },
    );
  }
  Future<Response> login({
    required String email,
    required String password,
  }) {
    return _dio.post(
      '/v1/auth/login/',
      data: {
        'email':    email,
        'password': password,
      },
    );
  }

  Future<void> sendPasswordResetEmail(SendEmailReset data) async {
    await _dio.post('/auth/users/reset_password/', data: data.toJson());
  }

  Future<void> resetPasswordConfirm({
    required String uid,
    required String token,
    required String newPassword,
  }) async {
    await _dio.post('/auth/users/reset_password_confirm/', data: {
      'uid': uid,
      'token': token,
      'new_password': newPassword,
    });
  }

  Future<void> setPassword(SetPassword data) async {
    await _dio.post('/auth/users/set_password/', data: data.toJson());
  }

  Future<void> resetUsernameConfirm(UsernameResetConfirm data) async {
    await _dio.post('/auth/users/reset_email_confirm/', data: data.toJson());
  }



  Future<void> logout() async {
    await _dio.post('/auth/jwt/blacklist/');
  }

  Future<bool> verifyToken(String token) async {
    try {
      await _dio.post('/auth/jwt/verify/', data: {'token': token});
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<User> getCurrentUser() async {
    final response = await _dio.get('/auth/users/me/');
    return User.fromJson(response.data);
  }

  Future<String?> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/v1/auth/token/refresh/',
        data: {'refresh': refreshToken},
      );
      return response.data['access'];
    } catch (e) {
      print('[AuthService] Refresh token failed: $e');
      return null;
    }
  }

}
