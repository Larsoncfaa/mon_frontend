// lib/fournisseurs/repositories/commande_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/commande.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commandeRepositoryProvider = Provider((_) => CommandeRepository());

class CommandeRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<Commande>> fetchAll() async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/orders/', options: Options(headers: {'Authorization': 'Token \$token'}));
    return (resp.data as List).map((e) => Commande.fromJson(e)).toList();
  }

  Future<Commande> fetchById(int id) async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/orders/\$id/', options: Options(headers: {'Authorization': 'Token \$token'}));
    return Commande.fromJson(resp.data);
  }
}