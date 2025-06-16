import '../../models/selection.dart';
import '../../services/selection_service.dart';
import 'dart:developer';

class SelectionRepository {
  final SelectionService service;

  SelectionRepository(this.service);

  Future<List<Selection>> getSelections() async {
    try {
      return await service.fetchSelections();
    } catch (e, stackTrace) {
      log('Erreur lors de la récupération des sélections', error: e, stackTrace: stackTrace);
      throw Exception('Impossible de récupérer les sélections.');
    }
  }

  Future<Selection> addSelection(Selection selection) async {
    try {
      return await service.createSelection(selection);
    } catch (e, stackTrace) {
      log('Erreur lors de l\'ajout de la sélection', error: e, stackTrace: stackTrace);
      throw Exception('Impossible d\'ajouter la sélection.');
    }
  }

  Future<Selection> editSelection(int id, Selection selection) async {
    try {
      return await service.updateSelection(id, selection);
    } catch (e, stackTrace) {
      log('Erreur lors de la mise à jour de la sélection', error: e, stackTrace: stackTrace);
      throw Exception('Impossible de mettre à jour la sélection.');
    }
  }

  Future<void> removeSelection(int id) async {
    try {
      await service.deleteSelection(id);
    } catch (e, stackTrace) {
      log('Erreur lors de la suppression de la sélection', error: e, stackTrace: stackTrace);
      throw Exception('Impossible de supprimer la sélection.');
    }
  }
}
