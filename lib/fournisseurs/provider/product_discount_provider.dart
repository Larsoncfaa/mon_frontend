import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_product_discount_list.dart';
import '../../services/product_discount_service.dart';
import '../notifications/product_discount_notifier.dart';
import '../repositories/product_discount_repository.dart';

/// 1. Service Provider
final productDiscountServiceProvider = Provider<ProductDiscountService>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductDiscountService(dio);
});

/// 2. Repository Provider
final productDiscountRepositoryProvider = Provider<ProductDiscountRepository>((ref) {
  final service = ref.watch(productDiscountServiceProvider);
  return ProductDiscountRepository(service);
});

/// 3. Notifier Provider (Riverpod 3.x)
final productDiscountNotifierProvider = NotifierProvider<
    ProductDiscountNotifier, AsyncValue<PaginatedProductDiscountList>>(
  ProductDiscountNotifier.new,
);