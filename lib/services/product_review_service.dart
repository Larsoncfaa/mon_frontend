import 'package:dio/dio.dart';

import '../models/product_review.dart';


class ProductReviewService {
  final Dio _dio;

  ProductReviewService(this._dio);

  Future<List<ProductReview>> getAll() async {
    final response = await _dio.get('/product-reviews/');
    return (response.data as List)
        .map((json) => ProductReview.fromJson(json))
        .toList();
  }

  Future<ProductReview> get(int id) async {
    final response = await _dio.get('/product-reviews/$id/');
    return ProductReview.fromJson(response.data);
  }

  Future<ProductReview> create(ProductReview review) async {
    final response = await _dio.post('/product-reviews/', data: review.toJson());
    return ProductReview.fromJson(response.data);
  }

  Future<ProductReview> update(ProductReview review) async {
    final response = await _dio.put('/product-reviews/${review.id}/', data: review.toJson());
    return ProductReview.fromJson(response.data);
  }

  Future<void> delete(int id) async {
    await _dio.delete('/product-reviews/$id/');
  }
}
