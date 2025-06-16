// lib/core/network/dio_provider.dart

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../interceptors/auth_interceptor.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final dioProvider = Provider<Dio>((ref) {
  final secureStorage = ref.read(secureStorageProvider);

  final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.11:8000/api/v1', // 🔁 Personnalise ceci
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    contentType: 'application/json',
  ));

  dio.interceptors.add(AuthInterceptor(secureStorage: secureStorage));

  return dio;
});
