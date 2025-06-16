import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../../models/product.dart';
import '../../pagination/paginated_product_list.dart';
import '../../services/product_service.dart';

class ProductRepository {
  final ProductService service;

  ProductRepository(this.service);

  /// Récupère la liste des produits paginée
  Future<PaginatedProductList> fetchProducts({int page = 1}) {
    debugPrint('ProductRepository: fetchProducts page=$page');
    return service.fetchProducts(page: page);
  }

  /// Récupère un produit spécifique via son ID
  Future<Product> getProduct(int id) {
    debugPrint('ProductRepository: getProduct id=$id');
    return service.getProduct(id);
  }

  /// Crée un nouveau produit avec éventuellement une image
  Future<Product> createProduct(Product product, {File? imageFile}) {
    debugPrint('ProductRepository: createProduct name=${product.name}');
    return service.createProduct(product, imageFile: imageFile);
  }

  /// Met à jour un produit avec éventuellement une nouvelle image
  Future<Product> updateProduct(Product product, {File? imageFile}) {
    debugPrint('ProductRepository: updateProduct id=${product.id}');
    return service.updateProduct(product, imageFile: imageFile);
  }

  /// Supprime un produit par son ID
  Future<void> deleteProduct(int id) {
    debugPrint('ProductRepository: deleteProduct id=$id');
    return service.deleteProduct(id);
  }

  /// Récupère une page suivante de produits en fonction de l'URL
  Future<PaginatedProductList> fetchNextUrl(String url) {
    debugPrint('ProductRepository: fetchNextUrl url=$url');
    return service.fetchNextPage(url);
  }

  /// Récupère des produits filtrés par catégorie
  Future<PaginatedProductList> fetchProductsFilteredByCategory(String? category) {
    debugPrint('ProductRepository: fetchProductsFilteredByCategory category=$category');
    return service.fetchProductsFilteredByCategory(category);
  }

  /// Recherche des produits en fonction d'une requête
  Future<PaginatedProductList> searchProducts(String query) {
    debugPrint('ProductRepository: searchProducts query=$query');
    return service.searchProducts(query);
  }

  /// Vérifie si un produit existe déjà par son nom et sa catégorie
  Future<bool> checkProductExists(String name, String category, {int? excludeId}) async {
    debugPrint('ProductRepository: checkProductExists name=$name, category=$category, excludeId=$excludeId');
    return await service.checkProductExists(name, category, excludeId: excludeId);
  }
}
