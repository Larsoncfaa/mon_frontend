import 'package:dio/dio.dart';
import '../models/product_discount.dart';
import '../pagination/paginated_product_discount_list.dart';


class ProductDiscountService {
  final Dio _dio;

  ProductDiscountService(this._dio);

  Future<PaginatedProductDiscountList> getList({int page = 1}) async {
    final response = await _dio.get('/v1/product-discounts/', queryParameters: {'page': page});
    return PaginatedProductDiscountList.fromJson(response.data);
  }

  Future<ProductDiscount> get(int id) async {
    final response = await _dio.get('/v1/product-discounts/$id/');
    return ProductDiscount.fromJson(response.data);
  }

  Future<ProductDiscount> create(ProductDiscount data) async {
    final response = await _dio.post('/v1/product-discounts/', data: data.toJson());
    return ProductDiscount.fromJson(response.data);
  }

  Future<ProductDiscount> update(int id, ProductDiscount data) async {
    final response = await _dio.put('/v1/product-discounts/$id/', data: data.toJson());
    return ProductDiscount.fromJson(response.data);
  }

  Future<void> delete(int id) async {
    await _dio.delete('/v1/product-discounts/$id/');
  }
}
