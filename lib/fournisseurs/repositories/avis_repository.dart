// lib/fournisseurs/repositories/avis_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/avis_fidelite.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final avisRepositoryProvider = Provider((_) => AvisRepository());
class AvisRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<AvisProduit>> fetchByProduit(int produitId) async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/reviews/?product=$produitId', options: Options(headers: {'Authorization': 'Token $token'}));
    return (resp.data as List).map((e) => AvisProduit.fromJson(e)).toList();
  }
}