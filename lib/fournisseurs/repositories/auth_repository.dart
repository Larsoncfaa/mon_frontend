
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../donnees/utilisateur.dart';


final authRepositoryProvider = Provider((_) => AuthRepository());

class AuthRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Utilisateur> login(String email, String mdp) async {
    final resp = await _dio.post('/auth/login/', data: {'email': email, 'password': mdp});
    final json = resp.data;
    await _storage.write(key: 'token', value: json['token']);
    return Utilisateur.fromJson(json['user']);
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
  }
}