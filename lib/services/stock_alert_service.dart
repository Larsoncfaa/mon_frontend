import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../models/stock_alert.dart';
import '../pagination/paginated_stock_alert_list.dart';

class StockAlertService {
  final Dio dio;

  StockAlertService(this.dio);

  Future<PaginatedStockAlertList> fetchStockAlerts({int page = 1}) async {
    debugPrint("🔄 [StockAlertService] fetchStockAlerts(page: $page) démarré");
    try {
      final response = await dio.get(
        '/stock-alerts/',
        queryParameters: {'page': page},
      );

      final data = response.data;
      debugPrint("📥 [StockAlertService] response.data brut = $data");

      if (data is List) {
        // Cas sans pagination : une liste brute
        final results = data
            .map((e) => StockAlert.fromJson(e as Map<String, dynamic>))
            .toList();
        return PaginatedStockAlertList(
          count: results.length,
          next: null,
          previous: null,
          results: results,
        );
      } else if (data is Map<String, dynamic>) {
        // Cas avec pagination DRF
        final parsed = PaginatedStockAlertList.fromJson(data);
        debugPrint("✅ [StockAlertService] PaginatedStockAlertList créé avec ${parsed.results.length} alertes");
        return parsed;
      } else {
        throw Exception("⚠️ Format inattendu: ${data.runtimeType}");
      }
    } on DioException catch (e) {
      debugPrint("❌ [StockAlertService] Erreur fetchStockAlerts: ${e.response?.data}");
      rethrow;
    }
  }

  Future<StockAlert> getStockAlert(int id) async {
    debugPrint("🔄 [StockAlertService] getStockAlert(id: $id) démarré");
    try {
      final response = await dio.get('/stock-alerts/$id/');
      debugPrint("📥 [StockAlertService] response.data getStockAlert = ${response.data}");

      final alert = StockAlert.fromJson(response.data);
      debugPrint("✅ [StockAlertService] StockAlert.fromJson créé = $alert");
      return alert;
    } on DioException catch (e) {
      debugPrint("❌ [StockAlertService] Erreur getStockAlert: ${e.response?.data}");
      rethrow;
    }
  }

  Future<StockAlert> createStockAlert(StockAlert alert) async {
    debugPrint("🔄 [StockAlertService] createStockAlert(alert: $alert)");

    try {
      // Préparation du payload
      final data = alert.toJson()
        ..remove('id') // Supprime l'ID si il est présent
        ..removeWhere((key, value) => value == null);

      // Ajouter les IDs pour product et warehouse
      data['product_id'] = alert.product.id;
      data['warehouse_id'] = alert.warehouse?.id;

      debugPrint("⏩ [StockAlertService] payload create = $data");

      // Envoi de la requête POST
      final response = await dio.post('/stock-alerts/', data: data);
      debugPrint("📥 [StockAlertService] response.data create = ${response.data}");

      // Création de l'alerte depuis la réponse
      final created = StockAlert.fromJson(response.data);
      debugPrint("✅ [StockAlertService] StockAlert créé = $created");
      return created;
    } on DioException catch (e) {
      debugPrint("❌ [StockAlertService] Erreur createStockAlert: ${e.response?.data}");
      rethrow;
    }
  }
  Future<StockAlert> updateStockAlert(StockAlert alert) async {
    debugPrint("🔄 [StockAlertService] updateStockAlert(id: ${alert.id})");
    try {
      final data = alert.toJson()..removeWhere((key, value) => value == null);
      debugPrint("⏩ [StockAlertService] payload update = $data");

      final response = await dio.put(
        '/stock-alerts/${alert.id}/',
        data: data,
      );
      debugPrint("📥 [StockAlertService] response.data update = ${response.data}");

      final updated = StockAlert.fromJson(response.data);
      debugPrint("✅ [StockAlertService] StockAlert mis à jour = $updated");
      return updated;
    } on DioException catch (e) {
      debugPrint("❌ [StockAlertService] Erreur updateStockAlert: ${e.response?.data}");
      rethrow;
    }
  }

  Future<void> deleteStockAlert(int id) async {
    debugPrint("🔄 [StockAlertService] deleteStockAlert(id: $id)");
    try {
      await dio.delete('/stock-alerts/$id/');
      debugPrint("✅ [StockAlertService] StockAlert supprimé (id: $id)");
    } on DioException catch (e) {
      debugPrint("❌ [StockAlertService] Erreur deleteStockAlert: ${e.response?.data}");
      rethrow;
    }
  }
}
