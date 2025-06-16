import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/selection.dart';
import '../repositories/selection_repository.dart';

class SelectionState {
  final List<Selection> selections;
  final bool isLoading;
  final String? error;

  SelectionState({
    this.selections = const [],
    this.isLoading = false,
    this.error,
  });

  SelectionState copyWith({
    List<Selection>? selections,
    bool? isLoading,
    String? error,
  }) {
    return SelectionState(
      selections: selections ?? this.selections,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class SelectionNotifier extends StateNotifier<SelectionState> {
  final SelectionRepository repository;

  SelectionNotifier(this.repository) : super(SelectionState());

  // Méthode pour charger les sélections
  Future<void> loadSelections() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      debugPrint('Chargement des sélections...');
      final data = await repository.getSelections();
      debugPrint('Sélections récupérées : ${data.length} éléments');
      state = state.copyWith(selections: data, isLoading: false);
    } catch (e, stackTrace) {
      log('Erreur dans loadSelections', error: e, stackTrace: stackTrace);
      state = state.copyWith(isLoading: false, error: 'Impossible de charger les sélections');
    }
  }

  // Méthode pour ajouter une sélection
  Future<void> addSelection(Selection selection) async {
    try {
      debugPrint('Ajout de la sélection : ${selection.toJson()}');
      final newSelection = await repository.addSelection(selection);

      // Vérifier si la sélection existe déjà pour éviter les doublons
      if (!state.selections.any((s) => s.id == newSelection.id)) {
        debugPrint('Sélection ajoutée avec succès : ${newSelection.toJson()}');
        state = state.copyWith(selections: [...state.selections, newSelection]);
      } else {
        debugPrint('La sélection existe déjà dans la liste');
      }
    } catch (e, stackTrace) {
      log('Erreur dans addSelection', error: e, stackTrace: stackTrace);
      state = state.copyWith(error: 'Erreur lors de l\'ajout de la sélection');
      rethrow;
    }
  }

  // Méthode pour mettre à jour une sélection
  Future<void> updateSelection(int id, Selection selection) async {
    try {
      debugPrint('Mise à jour de la sélection ID: $id');
      final updated = await repository.editSelection(id, selection);
      debugPrint('Sélection mise à jour : ${updated.toJson()}');

      // Vérifier si la sélection a bien été mise à jour
      state = state.copyWith(
        selections: state.selections.map((s) => s.id == id ? updated : s).toList(),
      );
    } catch (e, stackTrace) {
      log('Erreur dans updateSelection', error: e, stackTrace: stackTrace);
      state = state.copyWith(error: 'Erreur lors de la mise à jour de la sélection');
      rethrow;
    }
  }

  // Méthode pour supprimer une sélection
  Future<void> deleteSelection(int id) async {
    try {
      debugPrint('Suppression de la sélection ID: $id');
      await repository.removeSelection(id);
      debugPrint('Sélection supprimée ID: $id');

      state = state.copyWith(
        selections: state.selections.where((s) => s.id != id).toList(),
      );
    } catch (e, stackTrace) {
      log('Erreur dans deleteSelection', error: e, stackTrace: stackTrace);
      state = state.copyWith(error: 'Erreur lors de la suppression de la sélection');
      rethrow;
    }
  }
}
