// lib/fournisseurs/repositories/produit_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/produit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final produitRepositoryProvider = Provider((_) => ProduitRepository());

class ProduitRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<Produit>> fetchAll() async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/products/', options: Options(headers: {'Authorization': 'Token \$token'}));
    return (resp.data as List).map((e) => Produit.fromJson(e)).toList();
  }

  Future<Produit> fetchById(int id) async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/products/\$id/', options: Options(headers: {'Authorization': 'Token \$token'}));
    return Produit.fromJson(resp.data);
  }
}
