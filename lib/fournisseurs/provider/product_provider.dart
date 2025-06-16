import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_product_list.dart';
import '../repositories/product_repository.dart';
import '../notifications/product_notifier.dart';
import '../../services/product_service.dart';

/// Provider de service Dio pour les requêtes HTTP.
final productServiceProvider = Provider<ProductService>((ref) {
  final dio = ref.watch(dioProvider);
  debugPrint('[productServiceProvider] Instance de Dio obtenue');
  return ProductService(dio);
});

/// Provider du repository de produit qui utilise le service.
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final productService = ref.watch(productServiceProvider);
  debugPrint('[productRepositoryProvider] Instance de ProductService obtenue');
  return ProductRepository(productService);
});

/// Provider principal du notifier avec pagination.
final productProvider = StateNotifierProvider<ProductNotifier, AsyncValue<PaginatedProductList>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  debugPrint('[productProvider] Instance de ProductRepository obtenue');
  return ProductNotifier(repository);
});


// Définition du ProductNotifierProvider
final productNotifierProvider = StateNotifierProvider<ProductNotifier, AsyncValue<PaginatedProductList>>((ref) {
  final repository = ref.read(productRepositoryProvider);
  return ProductNotifier(repository);
});