


import '../../models/category.dart';
import '../../services/category_service.dart';

/// Repository pour abstraire l'accès aux données de catégorie
class CategoryRepository {
  final CategoryService _service;

  CategoryRepository(this._service);

  Future<List<Category>> getAll() => _service.fetchCategories();

  Future<Category> getById(int id) => _service.fetchCategory(id);

  Future<Category> create(Category category) => _service.createCategory(category);

  Future<Category> update(Category category) => _service.updateCategory(category);

  Future<void> delete(int id) => _service.deleteCategory(id);
}
