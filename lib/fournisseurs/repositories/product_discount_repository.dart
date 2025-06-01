

import '../../models/product_discount.dart';
import '../../pagination/paginated_product_discount_list.dart';
import '../../services/product_discount_service.dart';

class ProductDiscountRepository {
  final ProductDiscountService service;

  ProductDiscountRepository(this.service);

  Future<PaginatedProductDiscountList> fetchAll({int page = 1}) {
    return service.getList(page: page);
  }

  Future<ProductDiscount> fetch(int id) {
    return service.get(id);
  }

  Future<ProductDiscount> create(ProductDiscount data) {
    return service.create(data);
  }

  Future<ProductDiscount> update(int id, ProductDiscount data) {
    return service.update(id, data);
  }

  Future<void> delete(int id) {
    return service.delete(id);
  }
}
