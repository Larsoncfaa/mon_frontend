import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product_review.dart';
import '../repositories/product_review_repository.dart';

class ProductReviewNotifier extends StateNotifier<AsyncValue<List<ProductReview>>> {
  final ProductReviewRepository _repository;

  ProductReviewNotifier(this._repository) : super(const AsyncLoading()) {
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    try {
      final reviews = await _repository.fetchAll();
      state = AsyncValue.data(reviews);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addReview(ProductReview review) async {
    await _repository.create(review);
    await fetchReviews();
  }

  Future<void> updateReview(ProductReview review) async {
    await _repository.update(review);
    await fetchReviews();
  }

  Future<void> deleteReview(int id) async {
    await _repository.delete(id);
    await fetchReviews();
  }
}
