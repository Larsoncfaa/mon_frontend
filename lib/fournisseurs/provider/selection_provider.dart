import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/selection.dart';
import '../../services/selection_service.dart';
import '../repositories/selection_repository.dart';

/// 1. Service Provider
final selectionServiceProvider = Provider<SelectionService>((ref) {
  final dio = ref.watch(dioProvider);
  return SelectionService(dio);
});

/// 2. Repository Provider
final selectionRepositoryProvider = Provider<SelectionRepository>((ref) {
  final service = ref.watch(selectionServiceProvider);
  return SelectionRepository(service);
});

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

/// Notifier moderne pour Riverpod 3.x
class SelectionNotifier extends Notifier<SelectionState> {

  @override
  SelectionState build() {
    Future.microtask(() => loadSelections());
    return SelectionState();
  }

  // Méthode pour charger les sélections
  Future<void> loadSelections() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(selectionRepositoryProvider);
      final data = await repository.getSelections();
      state = state.copyWith(selections: data, isLoading: false);
    } catch (e, stackTrace) {
      log('Erreur dans loadSelections', error: e, stackTrace: stackTrace);
      state = state.copyWith(isLoading: false, error: 'Impossible de charger les sélections');
    }
  }

  // Méthode pour ajouter une sélection
  Future<void> addSelection(Selection selection) async {
    try {
      final repository = ref.read(selectionRepositoryProvider);
      final newSelection = await repository.addSelection(selection);

      if (!state.selections.any((s) => s.id == newSelection.id)) {
        state = state.copyWith(selections: [...state.selections, newSelection]);
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
      final repository = ref.read(selectionRepositoryProvider);
      final updated = await repository.editSelection(id, selection);

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
      final repository = ref.read(selectionRepositoryProvider);
      await repository.removeSelection(id);

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

/// 3. Notifier Provider principal
final selectionNotifierProvider =
NotifierProvider<SelectionNotifier, SelectionState>(
  SelectionNotifier.new,
);
