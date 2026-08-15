import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage secureStorage;
  final Dio dio;

  AuthInterceptor({
    required this.secureStorage,
    required this.dio,
  });

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    try {
      final token = await secureStorage.read(
        key: 'access_token',
      );

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';

        print(
          '[AuthInterceptor] ✅ Authorization ajouté',
        );
      } else {
        print(
          '[AuthInterceptor] ⚠️ Aucun access token',
        );
      }
    } catch (e) {
      print(
        '[AuthInterceptor] ❌ Erreur lecture token : $e',
      );
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // Seulement pour les erreurs 401
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    final refreshToken = await secureStorage.read(
      key: 'refresh_token',
    );

    if (refreshToken == null || refreshToken.isEmpty) {
      print(
        '[AuthInterceptor] ⚠️ Aucun refresh token',
      );

      handler.next(err);
      return;
    }

    try {
      print(
        '[AuthInterceptor] 🔄 Tentative de refresh...',
      );

      /*
       * IMPORTANT :
       * On utilise le même Dio mais sans passer
       * par l'interceptor pour éviter une boucle 401.
       */
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: dio.options.baseUrl,
          contentType: 'application/json',
        ),
      );

      final response = await refreshDio.post(
        '/auth/token/refresh/',
        data: {
          'refresh': refreshToken,
        },
      );

      final newAccessToken = response.data['access'] as String?;
      final newRefreshToken = response.data['refresh'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) {
        print('[AuthInterceptor] ❌ Nouveau access token absent');
        handler.next(err);
        return;
      }

      await secureStorage.write(
        key: 'access_token',
        value: newAccessToken,
      );

// Important avec ROTATE_REFRESH_TOKENS = True
      if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
        await secureStorage.write(
          key: 'refresh_token',
          value: newRefreshToken,
        );

        print(
          '[AuthInterceptor] ✅ Nouveau refresh token enregistré',
        );
      }

      print(
        '[AuthInterceptor] ✅ Nouveau access token enregistré',
      );

      // Rejouer la requête originale
      final requestOptions = err.requestOptions;

      requestOptions.headers['Authorization'] =
      'Bearer $newAccessToken';

      final retryResponse = await dio.fetch(
        requestOptions,
      );

      print(
        '[AuthInterceptor] ✅ Requête rejouée',
      );

      handler.resolve(retryResponse);
    } catch (e) {
      print(
        '[AuthInterceptor] ❌ Refresh échoué : $e',
      );

      // Token probablement expiré/invalide
      await secureStorage.delete(
        key: 'access_token',
      );

      await secureStorage.delete(
        key: 'refresh_token',
      );

      handler.next(err);
    }
  }
}