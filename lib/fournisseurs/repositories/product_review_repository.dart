import 'package:flutter/foundation.dart';
import '../../models/product_review.dart';
import '../../services/product_review_service.dart';

class ProductReviewRepository {
  final ProductReviewService _service;

  ProductReviewRepository(this._service);


  Future<List<ProductReview>> fetchAll({required int productId}) async {
    try {
      final reviews = await _service.getAll(productId: productId);
      debugPrint('[Repository] fetchAll → ${reviews.length} avis chargés');
      return reviews;
    } catch (e, st) {
      debugPrint('[Repository] Erreur fetchAll: $e');
      debugPrint('$st');
      rethrow;
    }
  }


  Future<ProductReview> fetchById(int id) async {
    try {
      final review = await _service.get(id);
      debugPrint('[Repository] fetchById($id) → OK');
      return review;
    } catch (e, st) {
      debugPrint('[Repository] Erreur fetchById($id): $e');
      debugPrint('$st');
      rethrow;
    }
  }

  Future<ProductReview> create(ProductReview review) async {
    try {
      final created = await _service.create(review);
      debugPrint('[Repository] create → Avis créé avec id = ${created.id}');
      return created;
    } catch (e, st) {
      debugPrint('[Repository] Erreur create: $e');
      debugPrint('$st');
      rethrow;
    }
  }

  Future<ProductReview> update(ProductReview review) async {
    try {
      final updated = await _service.update(review);
      debugPrint('[Repository] update(id=${review.id}) → OK');
      return updated;
    } catch (e, st) {
      debugPrint('[Repository] Erreur update: $e');
      debugPrint('$st');
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      await _service.delete(id);
      debugPrint('[Repository] delete(id=$id) → supprimé');
    } catch (e, st) {
      debugPrint('[Repository] Erreur delete(id=$id): $e');
      debugPrint('$st');
      rethrow;
    }
  }
}
