import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_product_list.dart';
import '../../services/product_service.dart';
import '../notifications/product_notifier.dart';
import '../repositories/product_repository.dart';


// Provider du service
final productServiceProvider = Provider<ProductService>((ref) {
  final dio = ref.watch(dioProvider); // Assure-toi d'avoir ce provider global
  return ProductService(dio);
});

// Provider du repository
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final service = ref.watch(productServiceProvider);
  return ProductRepository(service);
});

// Provider du notifier
final productNotifierProvider =
StateNotifierProvider<ProductNotifier, AsyncValue<PaginatedProductList>>(
      (ref) {
    final repository = ref.watch(productRepositoryProvider);
    return ProductNotifier(repository);
  },
);
