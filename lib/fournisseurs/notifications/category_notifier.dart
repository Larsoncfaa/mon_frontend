import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/category.dart';
import '../repositories/category_repository.dart';

// Provider du repository (à adapter selon ton projet)
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  throw UnimplementedError('Initialisez votre CategoryRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class CategoryNotifier extends Notifier<AsyncValue<List<Category>>> {
  late final CategoryRepository _repository;

  @override
  AsyncValue<List<Category>> build() {
    _repository = ref.watch(categoryRepositoryProvider);
    loadCategories();
    return const AsyncValue.loading();
  }

  /// Charge les catégories depuis le backend
  Future<void> loadCategories() async {
    try {
      final categories = await _repository.getAll();
      state = AsyncValue.data(categories);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Ajoute une nouvelle catégorie à la liste
  Future<void> addCategory(Category category) async {
    try {
      final created = await _repository.create(category);
      state = AsyncValue.data([...state.value ?? [], created]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Supprime une catégorie de la liste
  Future<void> removeCategory(int id) async {
    try {
      await _repository.delete(id);
      state = AsyncValue.data((state.value ?? []).where((cat) => cat.id != id).toList());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Met à jour une catégorie dans la liste
  Future<void> updateCategory(Category updated) async {
    try {
      final newCat = await _repository.update(updated);
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

/// Provider pour Riverpod 3.x
final categoryNotifierProvider =
NotifierProvider<CategoryNotifier, AsyncValue<List<Category>>>(
  CategoryNotifier.new,
);