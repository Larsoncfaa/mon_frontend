// lib/fournisseurs/repositories/notification_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationRepositoryProvider = Provider((_) => NotificationRepository());
class NotificationRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<NotificationSysteme>> fetchAll() async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/notifications/', options: Options(headers: {'Authorization': 'Token $token'}));
    return (resp.data as List).map((e) => NotificationSysteme.fromJson(e)).toList();
  }
}