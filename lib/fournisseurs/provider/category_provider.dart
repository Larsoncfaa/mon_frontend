import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../core/network/dio_provider.dart';
import '../../models/category.dart';
import '../../services/category_service.dart';
import '../notifications/category_notifier.dart';
import '../repositories/category_repository.dart';





/// Fournit le service d’accès à l’API des catégories
final categoryServiceProvider = Provider<CategoryService>(
      (ref) => CategoryService(ref.watch(dioProvider)),
);

/// Fournit le repository de catégorie
final categoryRepositoryProvider = Provider<CategoryRepository>(
      (ref) => CategoryRepository(ref.watch(categoryServiceProvider)),
);

/// Fournit le notifier pour l’état des catégories
final categoryNotifierProvider = StateNotifierProvider<CategoryNotifier, AsyncValue<List<Category>>>(
      (ref) => CategoryNotifier(ref.watch(categoryRepositoryProvider)),
);
