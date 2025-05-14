// lib/fournisseurs/repositories/fidelite_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/avis_fidelite.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fideliteRepositoryProvider = Provider((_) => FideliteRepository());
class FideliteRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<ProgrammeFidelite> fetchPoints() async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/loyalty/', options: Options(headers: {'Authorization': 'Token $token'}));
    return ProgrammeFidelite.fromJson(resp.data);
  }
}