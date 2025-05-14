
// lib/fournisseurs/repositories/promo_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/promotions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final promoRepositoryProvider = Provider((_) => PromoRepository());
class PromoRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<List<CodePromo>> fetchCodes() async {
    final token = await _storage.read(key: 'token');
    final resp = await _dio.get('/promo-codes/', options: Options(headers: {'Authorization': 'Token $token'}));
    return (resp.data as List).map((e) => CodePromo.fromJson(e)).toList();
  }
}
