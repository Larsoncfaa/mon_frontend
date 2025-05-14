// lib/fournisseurs/repositories/retour_repository.dart
import 'package:dio/dio.dart';
import '../../donnees/retours.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final retourRepositoryProvider = Provider((_) => RetourRepository());
class RetourRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://ton-backend/api'));
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> postRetour(int commandeId, String motif) async {
    final token = await _storage.read(key: 'token');
    await _dio.post('/returns/',
      options: Options(headers: {'Authorization': 'Token $token'}),
      data: {'order': commandeId, 'reason': motif},
    );
  }
  Future<void> postEchange(int commandeId, String motif) async {
    final token = await _storage.read(key: 'token');
    await _dio.post('/exchanges/',
      options: Options(headers: {'Authorization': 'Token $token'}),
      data: {'order': commandeId, 'reason': motif},
    );
  }
  Future<void> postRemboursement(int commandeId, String motif) async {
    final token = await _storage.read(key: 'token');
    await _dio.post('/refunds/',
      options: Options(headers: {'Authorization': 'Token $token'}),
      data: {'order': commandeId, 'reason': motif},
    );
  }
}
