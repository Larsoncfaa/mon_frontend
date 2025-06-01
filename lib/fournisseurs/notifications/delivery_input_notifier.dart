import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/delivery_input.dart';
import '../repositories/delivery_input_repository.dart';

final deliveryInputNotifierProvider =
StateNotifierProvider<DeliveryInputNotifier, AsyncValue<void>>(
      (ref) => DeliveryInputNotifier(ref.watch(deliveryInputRepositoryProvider as ProviderListenable<DeliveryInputRepository>)),
);

mixin deliveryInputRepositoryProvider {
}

class DeliveryInputNotifier extends StateNotifier<AsyncValue<void>> {
  final DeliveryInputRepository repository;

  DeliveryInputNotifier(this.repository) : super(const AsyncData(null));

  Future<void> submitInput(DeliveryInput input) async {
    state = const AsyncLoading();
    try {
      await repository.createInput(input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateInput(int id, DeliveryInput input) async {
    state = const AsyncLoading();
    try {
      await repository.updateInput(id, input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
