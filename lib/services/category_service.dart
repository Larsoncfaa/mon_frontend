import 'package:dio/dio.dart';
import '../models/category.dart';

/// Service pour interagir avec l’API des catégories via HTTP
class CategoryService {
  final Dio _dio;

  CategoryService(this._dio);

  /// Récupère la liste des catégories depuis l’API (avec pagination)
  Future<List<Category>> fetchCategories() async {
    final response = await _dio.get('/categories/');
    final data = response.data;

    // Extraction de la liste sous la clé 'results'
    final List<dynamic> results = data['results'];
    return results.map((json) => Category.fromJson(json)).toList();
  }

  /// Récupère une catégorie spécifique par ID
  Future<Category> fetchCategory(int id) async {
    final response = await _dio.get('/categories/$id/');
    return Category.fromJson(response.data);
  }

  /// Crée une nouvelle catégorie
  Future<Category> createCategory(Category category) async {
    final response = await _dio.post('/categories/', data: category.toJson());
    return Category.fromJson(response.data);
  }

  /// Met à jour une catégorie existante
  Future<Category> updateCategory(Category category) async {
    final response = await _dio.put('/categories/${category.id}/', data: category.toJson());
    return Category.fromJson(response.data);
  }

  /// Supprime une catégorie
  Future<void> deleteCategory(int id) async {
    await _dio.delete('/categories/$id/');
  }
}
