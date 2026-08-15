import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/product_review.dart';
import '../../services/product_review_service.dart';
import '../repositories/product_review_repository.dart';

/// 1. Service Provider
final productReviewServiceProvider = Provider<ProductReviewService>((ref) {
  return ProductReviewService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final productReviewRepositoryProvider = Provider<ProductReviewRepository>((ref) {
  return ProductReviewRepository(ref.watch(productReviewServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class ProductReviewNotifier extends Notifier<AsyncValue<List<ProductReview>>> {
  int? _productId;

  @override
  AsyncValue<List<ProductReview>> build() {
    return const AsyncValue.data([]);
  }

  // Appelé depuis l'extérieur pour charger les avis d'un produit spécifique
  Future<void> fetchReviews({required int productId}) async {
    _productId = productId;
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(productReviewRepositoryProvider);
      final reviews = await repository.fetchAll(productId: productId);
      state = AsyncValue.data(reviews);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addReview(ProductReview review) async {
    try {
      final repository = ref.read(productReviewRepositoryProvider);
      await repository.create(review);
      await fetchReviews(productId: review.product);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateReview(ProductReview review) async {
    try {
      final repository = ref.read(productReviewRepositoryProvider);
      await repository.update(review);
      if (_productId != null) {
        await fetchReviews(productId: _productId!);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteReview(int id) async {
    try {
      final repository = ref.read(productReviewRepositoryProvider);
      await repository.delete(id);
      if (_productId != null) {
        await fetchReviews(productId: _productId!);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final productReviewNotifierProvider = NotifierProvider<
    ProductReviewNotifier, AsyncValue<List<ProductReview>>>(
  ProductReviewNotifier.new,
);
