import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/category.dart';
import '../repositories/category_repository.dart';

/// Notifier pour gérer l'état de la liste de catégories
class CategoryNotifier extends StateNotifier<AsyncValue<List<Category>>> {
  final CategoryRepository _repository;

  CategoryNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadCategories();
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

  void fetchCategories() {}
}
