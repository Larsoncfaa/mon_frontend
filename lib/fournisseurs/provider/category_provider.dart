import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/category.dart';
import '../../services/category_service.dart';
import '../repositories/category_repository.dart';

/// 1. Service Provider
final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(categoryServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class CategoryNotifier extends Notifier<AsyncValue<List<Category>>> {
  @override
  AsyncValue<List<Category>> build() {
    Future.microtask(() => loadCategories());
    return const AsyncValue.loading();
  }

  /// Charge les catégories depuis le backend
  Future<void> loadCategories() async {
    try {
      final repository = ref.read(categoryRepositoryProvider);
      final categories = await repository.getAll();
      state = AsyncValue.data(categories);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Ajoute une nouvelle catégorie à la liste
  Future<void> addCategory(Category category) async {
    try {
      final repository = ref.read(categoryRepositoryProvider);
      final created = await repository.create(category);
      state = AsyncValue.data([...state.value ?? [], created]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Supprime une catégorie de la liste
  Future<void> removeCategory(int id) async {
    try {
      final repository = ref.read(categoryRepositoryProvider);
      await repository.delete(id);
      state = AsyncValue.data((state.value ?? []).where((cat) => cat.id != id).toList());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Met à jour une catégorie dans la liste
  Future<void> updateCategory(Category updated) async {
    try {
      final repository = ref.read(categoryRepositoryProvider);
      final newCat = await repository.update(updated);
      final list = (state.value ?? [])
          .map((cat) => cat.id == newCat.id ? newCat : cat)
          .toList();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void fetchCategories() {
    loadCategories();
  }
}

/// 3. Notifier Provider principal
final categoryNotifierProvider =
NotifierProvider<CategoryNotifier, AsyncValue<List<Category>>>(
  CategoryNotifier.new,
);
