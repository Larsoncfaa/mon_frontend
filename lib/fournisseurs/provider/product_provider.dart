import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_product_list.dart';
import '../../services/product_service.dart';
import '../notifications/product_notifier.dart';
import '../repositories/product_repository.dart';

/// 1. Service Provider
final productServiceProvider = Provider<ProductService>((ref) {
  final dio = ref.watch(dioProvider);
  debugPrint('[productServiceProvider] Instance de Dio obtenue');
  return ProductService(dio);
});

/// 2. Repository Provider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final productService = ref.watch(productServiceProvider);
  debugPrint('[productRepositoryProvider] Instance de ProductService obtenue');
  return ProductRepository(productService);
});

/// 3. Notifier Provider principal (Riverpod 3.x)
final productNotifierProvider = NotifierProvider<ProductNotifier,
    AsyncValue<PaginatedProductList>>(
  ProductNotifier.new,
);

/// Alias pour la compatibilité avec l'existant
final productProvider = productNotifierProvider;
