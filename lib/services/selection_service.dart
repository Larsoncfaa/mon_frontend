import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/selection.dart';

class SelectionService {
  final Dio dio;

  SelectionService(this.dio);

  Future<List<Selection>> fetchSelections() async {
    try {
      final response = await dio.get('/selections/');

      // Vérifier que la clé 'results' existe bien dans la réponse
      if (response.data != null && response.data['results'] is List) {
        print('Données récupérées des sélections: ${response.data['results']}');
        return (response.data['results'] as List)
            .map((json) => Selection.fromJson(json))
            .toList();
      } else {
        throw Exception('Les données des sélections sont incorrectes ou absentes.');
      }
    } catch (e, stackTrace) {
      log('Erreur lors de la récupération des sélections', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Selection> createSelection(Selection selection) async {
    try {
      final selectionData = selection.toJson();
      print('Données envoyées pour la création de la sélection: $selectionData');

      final response = await dio.post('/selections/', data: selectionData);

      // Vérifier le code de statut pour s'assurer de la réussite
      if (response.statusCode == 201) {
        print('Réponse après création: ${response.data}');
        return Selection.fromJson(response.data);
      } else {
        throw Exception('Erreur lors de la création de la sélection, statut: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      log('Erreur lors de la création d\'une sélection', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Selection> updateSelection(int id, Selection selection) async {
    try {
      final selectionData = selection.toJson();
      print('Données envoyées pour la mise à jour de la sélection: $selectionData');

      final response = await dio.put('/selections/$id/', data: selectionData);

      // Vérifier le code de statut pour s'assurer de la réussite
      if (response.statusCode == 200) {
        print('Réponse après mise à jour: ${response.data}');
        return Selection.fromJson(response.data);
      } else {
        throw Exception('Erreur lors de la mise à jour de la sélection, statut: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      log('Erreur lors de la mise à jour de la sélection', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> deleteSelection(int id) async {
    try {
      final response = await dio.delete('/selections/$id/');

      // Vérification si la suppression a été effectuée correctement
      if (response.statusCode == 204) {
        print('Sélection supprimée avec succès.');
      } else {
        throw Exception('Erreur lors de la suppression de la sélection, statut: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      log('Erreur lors de la suppression de la sélection', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
