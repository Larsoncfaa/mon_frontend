import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/batch.dart';
import 'package:intl/intl.dart';

class BatchService {
  final Dio dio;

  BatchService(this.dio);

  /// Récupère tous les lots (batches)
  Future<List<Batch>> getBatches() async {
    debugPrint('🔄 [BatchService] Fetching batches...');
    try {
      final response = await dio.get('/batches/');
      debugPrint('✅ [BatchService] Response status: ${response.statusCode}');
      debugPrint('📦 [BatchService] Raw data: ${response.data}');

      if (response.data is Map<String, dynamic> &&
          (response.data as Map<String, dynamic>).containsKey('results')) {
        final List data = (response.data as Map<String, dynamic>)['results'] as List;
        debugPrint('📦 [BatchService] Fetched ${data.length} batches (paginated)');
        return data
            .map((e) => Batch.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      if (response.data is List) {
        final List data = response.data as List;
        debugPrint('📦 [BatchService] Fetched ${data.length} batches (non-paginated)');
        return data
            .map((e) => Batch.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      debugPrint('⚠️ [BatchService] Fetched 0 batches (unexpected format)');
      return <Batch>[];
    } on DioException catch (e) {
      debugPrint(
        '❌ [BatchService] getBatches failed: ${e.response?.statusCode} ${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  /// Récupère un lot par son ID
  Future<Batch> getBatch(int id) async {
    debugPrint('🔄 [BatchService] Fetching batch with id: $id');
    try {
      final response = await dio.get('/batches/$id/');
      debugPrint('✅ [BatchService] Got batch: ${response.data}');
      return Batch.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      debugPrint(
        '❌ [BatchService] getBatch failed: ${e.response?.statusCode} ${e.response?.data ?? e.message}',
      );
      rethrow;
    }
  }

  /// Crée un nouveau lot
  Future<Batch> createBatch(Batch batch) async {
    final rawData = batch.toJson();
    rawData.remove('id');
    rawData['expiration_date'] =
        DateFormat('yyyy-MM-dd').format(batch.expirationDate);

    debugPrint('🆕 [BatchService] Creating new batch (formatted): $rawData');
    try {
      final response = await dio.post('/batches/', data: rawData);
      debugPrint('✅ [BatchService] Created batch: ${response.data}');
      return Batch.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      debugPrint(
        '❌ [BatchService] createBatch error: ${e.response?.statusCode} ${e.response?.data}',
      );
      rethrow;
    }
  }

  /// Met à jour un lot
  Future<Batch> updateBatch(int id, Batch batch) async {
    final rawData = batch.toJson();
    rawData['expiration_date'] =
        DateFormat('yyyy-MM-dd').format(batch.expirationDate);

    debugPrint('♻️ [BatchService] Updating batch $id with formatted data: $rawData');
    try {
      final response = await dio.put('/batches/$id/', data: rawData);
      debugPrint('✅ [BatchService] Updated batch: ${response.data}');
      return Batch.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      debugPrint(
        '❌ [BatchService] updateBatch error: ${e.response?.statusCode} ${e.response?.data}',
      );
      rethrow;
    }
  }

  /// Supprime un lot
  Future<void> deleteBatch(int id) async {
    debugPrint('🗑️ [BatchService] Deleting batch with id: $id');
    try {
      await dio.delete('/batches/$id/');
      debugPrint('✅ [BatchService] Deleted batch $id');
    } on DioException catch (e) {
      debugPrint(
        '❌ [BatchService] deleteBatch error: ${e.response?.statusCode} ${e.response?.data}',
      );
      rethrow;
    }
  }
}
