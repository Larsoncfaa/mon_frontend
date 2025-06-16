import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../models/stock_movement.dart';
import '../pagination/paginated_stock_movement_list.dart';

/// Service API pour la gestion des mouvements de stock
class StockMovementService {
  final Dio dio;

  StockMovementService(this.dio);

  /// Récupère une page de mouvements de stock
  Future<PaginatedStockMovementList> fetchStockMovements({int page = 1}) async {
    debugPrint("🔄 [StockMovementService] fetchStockMovements(page: $page) démarré");
    final response = await dio.get(
      '/stock-movements/',
      queryParameters: {'page': page},
    );
    debugPrint("📥 [StockMovementService] response.data brut = ${response.data}");

    final paginated = PaginatedStockMovementList.fromJson(response.data);
    debugPrint("✅ [StockMovementService] PaginatedStockMovementList.created, "
        "results = ${paginated.results}");
    return paginated;
  }

  /// Récupère un mouvement de stock par son ID
  Future<StockMovement> getStockMovement(int id) async {
    debugPrint("🔄 [StockMovementService] getStockMovement(id: $id) démarré");
    final response = await dio.get('/stock-movements/$id/');
    debugPrint("📥 [StockMovementService] response.data getStockMovement = ${response.data}");

    final movement = StockMovement.fromJson(response.data);
    debugPrint("✅ [StockMovementService] StockMovement.fromJson créé = $movement");
    return movement;
  }

  /// Crée un nouveau mouvement de stock avec gestion des erreurs
  Future<StockMovement> createStockMovement(StockMovement movement) async {
    debugPrint("🔄 [StockMovementService] createStockMovement(movement.id=${movement.id}) démarré");
    final data = movement.toJson()..remove('id');
    debugPrint("⏩ [StockMovementService] payload create = $data");

    try {
      final response = await dio.post('/stock-movements/', data: data);
      debugPrint("📥 [StockMovementService] response.data create = ${response.data}");

      final created = StockMovement.fromJson(response.data);
      debugPrint("✅ [StockMovementService] StockMovement créé = $created");
      return created;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        final errorData = e.response!.data;
        if (errorData is Map && errorData.containsKey('non_field_errors')) {
          final messages = (errorData['non_field_errors'] as List).join('\n');
          debugPrint("❌ [StockMovementService] Erreur métier : $messages");
          throw Exception(messages); // à attraper côté UI
        }
        debugPrint("❌ [StockMovementService] Erreur 400 : $errorData");
        throw Exception("Erreur lors de la création du mouvement.");
      } else {
        debugPrint("❌ [StockMovementService] Erreur réseau : ${e.message}");
        throw Exception("Erreur réseau : ${e.message}");
      }
    }
  }

  /// Met à jour un mouvement de stock existant
  Future<StockMovement> updateStockMovement(StockMovement movement) async {
    debugPrint("🔄 [StockMovementService] updateStockMovement(id: ${movement.id}) démarré");
    final response = await dio.put(
      '/stock-movements/${movement.id}/',
      data: movement.toJson(),
    );
    debugPrint("📥 [StockMovementService] response.data update = ${response.data}");

    final updated = StockMovement.fromJson(response.data);
    debugPrint("✅ [StockMovementService] StockMovement mis à jour = $updated");
    return updated;
  }

  /// Supprime un mouvement de stock par son ID
  Future<void> deleteStockMovement(int id) async {
    debugPrint("🔄 [StockMovementService] deleteStockMovement(id: $id) démarré");
    await dio.delete('/stock-movements/$id/');
    debugPrint("✅ [StockMovementService] StockMovement supprimé (id: $id)");
  }

  /// Méthode stub inutilisée, peut être laissée vide ou supprimée
  void when({
    required Column Function(dynamic movements) data,
    required Center Function() loading,
    required Text Function(dynamic err, dynamic _) error,
  }) {
    // Ne rien faire ici
  }
  Future<StockMovement> archiveStockMovement(int id) async {
    debugPrint("🔄 [StockMovementService] archiveStockMovement(id: $id) démarré");
    final response = await dio.patch(
      '/stock-movements/$id/',
      data: {'is_archived': true},
    );
    debugPrint("✅ [StockMovementService] Mouvement archivé : ${response.data}");
    return StockMovement.fromJson(response.data);
  }
  Future<StockMovement> restoreStockMovement(int id) async {
    debugPrint("🔄 [StockMovementService] restoreStockMovement(id: $id) démarré");
    final response = await dio.patch(
      '/stock-movements/$id/',
      data: {'is_archived': false},
    );
    debugPrint("✅ [StockMovementService] Mouvement restauré : ${response.data}");
    return StockMovement.fromJson(response.data);
  }
  /// Applique un mouvement de stock (met à jour stock_applied = true)
  Future<StockMovement> applyStockMovement(int id) async {
    debugPrint("🔄 [StockMovementService] applyStockMovement(id: $id) démarré");
    final response = await dio.patch(
      '/stock-movements/$id/',
      data: {'stock_applied': true},
    );
    debugPrint("✅ [StockMovementService] Mouvement appliqué : ${response.data}");
    return StockMovement.fromJson(response.data);
  }
}
