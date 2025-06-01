import 'package:dio/dio.dart';
import '../models/product.dart';
import '../pagination/paginated_product_list.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  Future<PaginatedProductList> fetchProducts({int page = 1}) async {
    final response = await dio.get('/v1/products/', queryParameters: {'page': page});
    return PaginatedProductList.fromJson(response.data);
  }

  Future<Product> getProduct(int id) async {
    final response = await dio.get('/v1/products/$id/');
    return Product.fromJson(response.data);
  }

  Future<Product> createProduct(Product product) async {
    final data = product.toJson()
      ..remove('id')
      ..remove('qr_code_image');
    final response = await dio.post('/v1/products/', data: data);
    return Product.fromJson(response.data);
  }

  Future<Product> updateProduct(Product product) async {
    final data = product.toJson()..remove('qr_code_image');
    final response = await dio.put('/v1/products/${product.id}/', data: data);
    return Product.fromJson(response.data);
  }

  Future<void> deleteProduct(int id) async {
    await dio.delete('/v1/products/$id/');
  }

  Future<PaginatedProductList> fetchNextPage(String url) async {
    final response = await dio.getUri(Uri.parse(url));
    return PaginatedProductList.fromJson(response.data);
  }

  Future<PaginatedProductList> searchProducts(String query) async {
    final response = await dio.get('/v1/products/', queryParameters: {'search': query});
    return PaginatedProductList.fromJson(response.data);
  }

  Future<PaginatedProductList> fetchProductsFilteredByCategory(String? category) async {
    final response = await dio.get('/v1/products/', queryParameters: {
      if (category != null && category.isNotEmpty) 'category__name': category,
    });
    return PaginatedProductList.fromJson(response.data);
  }
}
