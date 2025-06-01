

import '../../models/product_review.dart';
import '../../services/product_review_service.dart';

class ProductReviewRepository {
  final ProductReviewService _service;

  ProductReviewRepository(this._service);

  Future<List<ProductReview>> fetchAll() => _service.getAll();

  Future<ProductReview> fetchById(int id) => _service.get(id);

  Future<ProductReview> create(ProductReview review) => _service.create(review);

  Future<ProductReview> update(ProductReview review) => _service.update(review);

  Future<void> delete(int id) => _service.delete(id);
}
