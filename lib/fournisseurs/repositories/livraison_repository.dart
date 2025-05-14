// lib/fournisseurs/repositories/livraison_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/livraison.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final livraisonRepositoryProvider = Provider((_) => LivraisonRepository());
class LivraisonRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<Livraison>> fetchAll() async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/deliveries/', options: Options(headers: {'Authorization': 'Token $token'}));
    return (resp.data as List).map((e) => Livraison.fromJson(e)).toList();
  }

  Future<Livraison> fetchById(int id) async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/deliveries/$id/', options: Options(headers: {'Authorization': 'Token $token'}));
    return Livraison.fromJson(resp.data);
  }
}

