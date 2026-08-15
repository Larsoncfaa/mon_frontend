import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/delivery_input.dart';
import '../../services/delivery_input_service.dart';
import '../repositories/delivery_input_repository.dart';

/// 1. Service Provider
final deliveryInputServiceProvider = Provider<DeliveryInputService>((ref) {
  final dio = ref.watch(dioProvider);
  return DeliveryInputService(dio);
});

/// 2. Repository Provider
final deliveryInputRepositoryProvider = Provider<DeliveryInputRepository>((ref) {
  return DeliveryInputRepository(ref.watch(deliveryInputServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class DeliveryInputNotifier extends Notifier<AsyncValue<void>> {

  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  Future<void> submitInput(DeliveryInput input) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(deliveryInputRepositoryProvider);
      await repository.createInput(input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateInput(int id, DeliveryInput input) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(deliveryInputRepositoryProvider);
      await repository.updateInput(id, input);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final deliveryInputNotifierProvider =
NotifierProvider<DeliveryInputNotifier, AsyncValue<void>>(
  DeliveryInputNotifier.new,
);
