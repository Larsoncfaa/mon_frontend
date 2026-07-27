import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../services/selection_service.dart';
import '../notifications/selection_notifier.dart';
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

/// 3. Notifier Provider (Riverpod 3.x)
final selectionNotifierProvider =
NotifierProvider<SelectionNotifier, SelectionState>(
  SelectionNotifier.new,
);