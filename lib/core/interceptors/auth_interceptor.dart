// lib/core/interceptors/auth_interceptor.dart

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage secureStorage;

  AuthInterceptor({required this.secureStorage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await secureStorage.read(key: 'access_token');
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      print('[AuthInterceptor] Error reading token: $e');
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Si 401, tente de refresh le token
    if (err.response?.statusCode == 401) {
      final refresh = await secureStorage.read(key: 'refresh_token');
      if (refresh != null) {
        try {
          final response = await Dio().post(
            'https://10.0.2.2:8000/api/v1/auth/token/refresh/',
            data: {'refresh': refresh},
          );

          final newAccessToken = response.data['access'];
          await secureStorage.write(key: 'access_token', value: newAccessToken);

          // Réessaie la requête originale avec le nouveau token
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          final clonedRequest = await Dio().fetch(requestOptions);
          return handler.resolve(clonedRequest);
        } catch (e) {
          print('[AuthInterceptor] Token refresh failed: $e');
        }
      }
    }

    return handler.next(err);
  }
}

