import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/delivery_input.dart';
import '../repositories/delivery_input_repository.dart';

// Provider officiel du repository (à ajuster selon ton instanciation réelle)
final deliveryInputRepositoryProvider = Provider<DeliveryInputRepository>((ref) {
  throw UnimplementedError('Initialisez votre DeliveryInputRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class DeliveryInputNotifier extends Notifier<AsyncValue<void>> {
  late final DeliveryInputRepository _repository;

  @override
  AsyncValue<void> build() {
    _repository = ref.watch(deliveryInputRepositoryProvider);
    return const AsyncData(null);
  }

  Future<void> submitInput(DeliveryInput input) async {
    state = const AsyncLoading();
    try {
      await _repository.createInput(input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateInput(int id, DeliveryInput input) async {
    state = const AsyncLoading();
    try {
      await _repository.updateInput(id, input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final deliveryInputNotifierProvider =
NotifierProvider<DeliveryInputNotifier, AsyncValue<void>>(
  DeliveryInputNotifier.new,
);