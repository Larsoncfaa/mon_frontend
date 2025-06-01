import 'package:dio/dio.dart';
import '../models/category.dart';

/// Service pour interagir avec l’API des catégories via HTTP
class CategoryService {
  final Dio _dio;

  CategoryService(this._dio);

  /// Récupère la liste des catégories depuis l’API
  Future<List<Category>> fetchCategories() async {
    final response = await _dio.get('/v1/categories/');
    final data = response.data as List;
    return data.map((json) => Category.fromJson(json)).toList();
  }

  /// Récupère une catégorie spécifique par ID
  Future<Category> fetchCategory(int id) async {
    final response = await _dio.get('/v1/categories/$id/');
    return Category.fromJson(response.data);
  }

  /// Crée une nouvelle catégorie
  Future<Category> createCategory(Category category) async {
    final response = await _dio.post('/v1/categories/', data: category.toJson());
    return Category.fromJson(response.data);
  }

  /// Met à jour une catégorie existante
  Future<Category> updateCategory(Category category) async {
    final response = await _dio.put('/v1/categories/${category.id}/', data: category.toJson());
    return Category.fromJson(response.data);
  }

  /// Supprime une catégorie
  Future<void> deleteCategory(int id) async {
    await _dio.delete('/v1/categories/$id/');
  }
}
