import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product_review.dart';
import '../repositories/product_review_repository.dart';

class ProductReviewNotifier extends StateNotifier<AsyncValue<List<ProductReview>>> {
  final ProductReviewRepository _repository;
  int? _productId;

  ProductReviewNotifier(this._repository) : super(const AsyncLoading());

  // Appelé depuis l'extérieur pour charger les avis d'un produit spécifique
  Future<void> fetchReviews({required int productId}) async {
    _productId = productId;
    state = const AsyncLoading();
    try {
      final reviews = await _repository.fetchAll(productId: productId);
      debugPrint('[Notifier] fetchReviews → ${reviews.length} avis');
      state = AsyncValue.data(reviews);
    } catch (e, st) {
      debugPrint('[Notifier] Erreur fetchReviews: $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addReview(ProductReview review) async {
    try {
      debugPrint('[Notifier] addReview pour produit=${review.product}');
      await _repository.create(review);
      await fetchReviews(productId: review.product);
    } catch (e, st) {
      debugPrint('[Notifier] Erreur addReview: $e');
      state = AsyncValue.error(e, st);
    }
  }


  Future<void> updateReview(ProductReview review) async {
    try {
      debugPrint('[Notifier] updateReview(id=${review.id})...');
      await _repository.update(review);
      if (_productId != null) {
        await fetchReviews(productId: _productId!);
      }
    } catch (e, st) {
      debugPrint('[Notifier] Erreur updateReview: $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteReview(int id) async {
    try {
      debugPrint('[Notifier] deleteReview(id=$id)...');
      await _repository.delete(id);
      if (_productId != null) {
        await fetchReviews(productId: _productId!);
      }
    } catch (e, st) {
      debugPrint('[Notifier] Erreur deleteReview: $e');
      state = AsyncValue.error(e, st);
    }
  }

}
