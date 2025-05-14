// lib/fournisseurs/repositories/stock_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/stock.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockRepositoryProvider = Provider((_) => StockRepository());

class StockRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<StockLevel>> fetchStockLevels() async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/stock-levels/', options: Options(headers: {'Authorization': 'Token \$token'}));
    return (resp.data as List).map((e) => StockLevel.fromJson(e)).toList();
  }

  Future<List<MouvementStock>> fetchMovements(int produitId) async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/stock-movements/?product=\$produitId', options: Options(headers: {'Authorization': 'Token \$token'}));
    return (resp.data as List).map((e) => MouvementStock.fromJson(e)).toList();
  }
}
