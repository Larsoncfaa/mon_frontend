import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_product_discount_list.dart';
import '../../services/product_discount_service.dart';
import '../notifications/product_discount_notifier.dart';
import '../repositories/product_discount_repository.dart';



final productDiscountServiceProvider = Provider<ProductDiscountService>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductDiscountService(dio);
});

final productDiscountRepositoryProvider = Provider<ProductDiscountRepository>((ref) {
  final service = ref.watch(productDiscountServiceProvider);
  return ProductDiscountRepository(service);
});

final productDiscountNotifierProvider = StateNotifierProvider<ProductDiscountNotifier, AsyncValue<PaginatedProductDiscountList>>((ref) {
  final repo = ref.watch(productDiscountRepositoryProvider);
  return ProductDiscountNotifier(repo);
});
