

import '../../models/product.dart';
import '../../pagination/paginated_product_list.dart';
import '../../services/product_service.dart';

class ProductRepository {
  final ProductService service;

  ProductRepository(this.service);

  Future<PaginatedProductList> fetchProducts({int page = 1}) {
    return service.fetchProducts(page: page);
  }

  Future<Product> getProduct(int id) {
    return service.getProduct(id);
  }

  Future<Product> createProduct(Product product) {
    return service.createProduct(product);
  }

  Future<Product> updateProduct(Product product, Product updatedProduct) {
    return service.updateProduct(product);
  }

  Future<void> deleteProduct(int id) {
    return service.deleteProduct(id);
  }


  Future<PaginatedProductList> fetchNextUrl(String url) {
    return service.fetchNextPage(url);
  }

  Future<PaginatedProductList> fetchProductsFilteredByCategory(String? category) {
    return service.fetchProductsFilteredByCategory(category);
  }

  Future<PaginatedProductList> searchProducts(String query) {
    return service.searchProducts(query);
  }
}
