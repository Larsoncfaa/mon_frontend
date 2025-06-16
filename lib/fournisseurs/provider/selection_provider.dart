import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../services/selection_service.dart';
import '../notifications/selection_notifier.dart';
import '../repositories/selection_repository.dart';

final selectionServiceProvider = Provider<SelectionService>((ref) {
  final dio = ref.watch(dioProvider); // doit être défini dans dio_provider.dart
  return SelectionService(dio);
});

final selectionRepositoryProvider = Provider<SelectionRepository>((ref) {
  final service = ref.watch(selectionServiceProvider);
  return SelectionRepository(service);
});

final selectionNotifierProvider =
StateNotifierProvider<SelectionNotifier, SelectionState>((ref) {
  final repo = ref.watch(selectionRepositoryProvider);
  final notifier = SelectionNotifier(repo);

  // 🔥 Appel automatique du chargement des sélections au démarrage
  notifier.loadSelections();

  return notifier;
});
