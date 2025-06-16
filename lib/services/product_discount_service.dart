import 'package:dio/dio.dart';
import '../models/product_discount.dart';
import '../pagination/paginated_product_discount_list.dart';

class ProductDiscountService {
  final Dio _dio;

  ProductDiscountService(this._dio);

  /// Récupère la liste paginée des remises (page 1 par défaut)
  Future<PaginatedProductDiscountList> getList({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/discounts/',
        queryParameters: {'page': page},
      );
      return PaginatedProductDiscountList.fromJson(response.data);
    } on DioException catch (e) {
      final errorData = e.response?.data ?? e.message;
      throw Exception('Erreur récupération des remises : $errorData');
    }
  }

  /// Récupère une remise par son ID
  Future<ProductDiscount> get(int id) async {
    try {
      final response = await _dio.get('/discounts/$id/');
      return ProductDiscount.fromJson(response.data);
    } on DioException catch (e) {
      final errorData = e.response?.data ?? e.message;
      throw Exception('Erreur récupération de la remise : $errorData');
    }
  }

  /// Crée une nouvelle remise
  Future<ProductDiscount> create(ProductDiscount data) async {
    try {
      final response = await _dio.post(
        '/discounts/',
        data: data.toJson(),
      );
      return ProductDiscount.fromJson(response.data);
    } on DioException catch (e) {
      final errorData = e.response?.data ?? e.message;
      throw Exception('Erreur création de la remise : $errorData');
    }
  }

  /// Met à jour la remise [id]
  Future<ProductDiscount> update(int id, ProductDiscount data) async {
    try {
      final response = await _dio.put(
        '/discounts/$id/',
        data: data.toJson(),
      );
      return ProductDiscount.fromJson(response.data);
    } on DioException catch (e) {
      final errorData = e.response?.data ?? e.message;
      throw Exception('Erreur mise à jour de la remise : $errorData');
    }
  }

  /// Supprime la remise [id]
  Future<void> delete(int id) async {
    try {
      await _dio.delete('/discounts/$id/');
    } on DioException catch (e) {
      final errorData = e.response?.data ?? e.message;
      throw Exception('Erreur suppression de la remise : $errorData');
    }
  }
}
