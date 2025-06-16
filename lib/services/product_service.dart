import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/product.dart';
import '../pagination/paginated_product_list.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  /// Récupère une page de produits paginée
  Future<PaginatedProductList> fetchProducts({int page = 1}) async {
    debugPrint('ProductService: fetchProducts page=$page');
    final response = await dio.get(
      '/products/',
      queryParameters: {'page': page},
    );
    debugPrint('ProductService: fetchProducts response status=${response.statusCode}');
    return PaginatedProductList.fromJson(response.data);
  }

  /// Récupère un produit par son identifiant
  Future<Product> getProduct(int id) async {
    debugPrint('ProductService: getProduct id=$id');
    final response = await dio.get('/products/$id/');
    debugPrint('ProductService: getProduct response status=${response.statusCode}');
    return Product.fromJson(response.data);
  }

  /// Crée un produit avec tous les champs et une image (si fournie)
  Future<Product> createProduct(Product product, {File? imageFile}) async {
    debugPrint('ProductService: createProduct name=${product.name}, imageFile=${imageFile?.path}');
    final formData = FormData.fromMap({
      'name': product.name,
      'category': product.category,
      'description': product.description,
      'quantity_in_stock': product.quantityInStock,
      'unit': unitToJson(product.unit),
      'purchase_price': product.purchasePrice,
      'selling_price': product.sellingPrice,
      if (product.expirationDate != null)
        'expiration_date': product.expirationDate!.toIso8601String(),
      if (imageFile != null)
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
    });

    try {
      final response = await dio.post('/products/', data: formData);
      debugPrint('ProductService: createProduct response status=${response.statusCode}');
      debugPrint('ProductService: createProduct response data=${response.data}');
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('ProductService: createProduct error response=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ProductService: createProduct unknown error=$e');
      rethrow;
    }
  }

  /// Met à jour un produit avec tous les champs et une image (si changée)
  Future<Product> updateProduct(Product product, {File? imageFile}) async {
    debugPrint('ProductService: updateProduct id=${product.id}, imageFile=${imageFile?.path}');
    final formData = FormData.fromMap({
      'name': product.name,
      'category': product.category,
      'description': product.description,
      'quantity_in_stock': product.quantityInStock,
      'unit': unitToJson(product.unit),
      'purchase_price': product.purchasePrice,
      'selling_price': product.sellingPrice,
      if (product.expirationDate != null)
        'expiration_date': product.expirationDate!.toIso8601String(),
      if (imageFile != null)
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
    });

    try {
      final response = await dio.put('/products/${product.id}/', data: formData);
      debugPrint('ProductService: updateProduct response status=${response.statusCode}');
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('ProductService: updateProduct error response=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ProductService: updateProduct unknown error=$e');
      rethrow;
    }
  }

  /// Supprime un produit par son identifiant
  Future<void> deleteProduct(int id) async {
    debugPrint('ProductService: deleteProduct id=$id');
    try {
      final response = await dio.delete('/products/$id/');
      debugPrint('ProductService: deleteProduct response status=${response.statusCode}');
    } on DioException catch (e) {
      debugPrint('ProductService: deleteProduct error response=${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('ProductService: deleteProduct unknown error=$e');
      rethrow;
    }
  }

  /// Charge la page suivante à partir d'une URL complète
  Future<PaginatedProductList> fetchNextPage(String url) async {
    debugPrint('ProductService: fetchNextPage url=$url');
    final response = await dio.getUri(Uri.parse(url));
    debugPrint('ProductService: fetchNextPage response status=${response.statusCode}');
    return PaginatedProductList.fromJson(response.data);
  }

  /// Recherche des produits par mot-clé
  Future<PaginatedProductList> searchProducts(String query) async {
    debugPrint('ProductService: searchProducts query=$query');
    final response = await dio.get(
      '/products/',
      queryParameters: {'search': query},
    );
    debugPrint('ProductService: searchProducts response status=${response.statusCode}');
    return PaginatedProductList.fromJson(response.data);
  }

  /// Filtre les produits par nom de catégorie
  Future<PaginatedProductList> fetchProductsFilteredByCategory(String? category) async {
    debugPrint('ProductService: fetchProductsFilteredByCategory category=$category');
    final response = await dio.get(
      '/products/',
      queryParameters: {
        if (category != null && category.isNotEmpty) 'category__name': category,
      },
    );
    debugPrint('ProductService: fetchProductsFilteredByCategory response status=${response.statusCode}');
    return PaginatedProductList.fromJson(response.data);
  }
  Future<bool> checkProductExists(String name, String category, {int? excludeId}) async {
    debugPrint('ProductService: checkProductExists name=$name, category=$category');
    try {
      final response = await dio.get(
        '/products/check_duplicate/',
        queryParameters: {
          'name': name,
          'category': category,
        },
      );
      debugPrint('ProductService: checkProductExists response=${response.data}');
      return response.data['exists'] == true;
    } on DioException catch (e) {
      debugPrint('ProductService: checkProductExists error response=${e.response?.data}');
      return false; // on considère "pas de doublon" en cas d'erreur
    } catch (e) {
      debugPrint('ProductService: checkProductExists unknown error=$e');
      return false;
    }
  }
}
