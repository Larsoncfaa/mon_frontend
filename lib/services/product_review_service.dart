import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/product_review.dart';

class ProductReviewService {
  final Dio _dio;

  ProductReviewService(this._dio);

  // Liste les avis (optionnel : avec filtre produit)
  Future<List<ProductReview>> getAll({required int productId}) async {
    try {
      final response = await _dio.get(
        '/reviews/list/',
        queryParameters: {'product': productId},
      );
      debugPrint('[GET /reviews/list/?product=$productId] → ${response.statusCode}');
      return (response.data as List)
          .map((json) => ProductReview.fromJson(json))
          .toList();
    } on DioException catch (e) {
      debugPrint('Erreur [GET /reviews/list/]: ${e.response?.data}');
      throw Exception('Erreur lors du chargement des avis : ${e.message}');
    }
  }


  // Détail d’un avis
  Future<ProductReview> get(int id) async {
    try {
      final response = await _dio.get('/reviews/$id/');
      debugPrint('[GET /reviews/$id/] → ${response.statusCode}');
      return ProductReview.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Erreur [GET /reviews/$id/]: ${e.response?.data}');
      throw Exception('Erreur lors de la récupération de l\'avis #$id : ${e.message}');
    }
  }

  // Créer un nouvel avis
  Future<ProductReview> create(ProductReview review) async {
    try {
      final response = await _dio.post(
        '/reviews/',
        data: review.toJson(),
      );
      debugPrint('[POST /reviews/] → ${response.statusCode}');
      return ProductReview.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Erreur [POST /reviews/]: ${e.response?.data}');
      throw Exception('Erreur lors de la création de l\'avis : ${e.message}');
    }
  }

  // Mettre à jour un avis
  Future<ProductReview> update(ProductReview review) async {
    try {
      final response = await _dio.put(
        '/reviews/${review.id}/',
        data: review.toJson(),
      );
      debugPrint('[PUT /reviews/${review.id}/] → ${response.statusCode}');
      return ProductReview.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Erreur [PUT /reviews/${review.id}/]: ${e.response?.data}');
      throw Exception('Erreur lors de la mise à jour de l\'avis : ${e.message}');
    }
  }

  // Supprimer un avis
  Future<void> delete(int id) async {
    try {
      final response = await _dio.delete('/reviews/$id/');
      debugPrint('[DELETE /reviews/$id/] → ${response.statusCode}');
    } on DioException catch (e) {
      debugPrint('Erreur [DELETE /reviews/$id/]: ${e.response?.data}');
      throw Exception('Erreur lors de la suppression de l\'avis : ${e.message}');
    }
  }
}
