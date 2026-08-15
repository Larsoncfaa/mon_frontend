import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/cart.dart';
import '../../services/cart_service.dart';
import '../repositories/cart_repository.dart';

/// 1. Service Provider
final cartServiceProvider = Provider<CartService>((ref) {
  final dio = ref.watch(dioProvider);
  return CartService(dio);
});

/// 2. Repository Provider
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final service = ref.watch(cartServiceProvider);
  return CartRepository(service);
});

/// Notifier moderne pour Riverpod 3.x
class CartNotifier extends Notifier<AsyncValue<Cart?>> {
  @override
  AsyncValue<Cart?> build() {
    Future.microtask(() => loadCart());
    return const AsyncLoading();
  }

  Future<void> loadCart() async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(cartRepositoryProvider);
      final cart = await repository.getCart();
      if (cart == null) {
        state = AsyncError('Aucun panier disponible', StackTrace.current);
      } else {
        state = AsyncData(cart);
      }
    } catch (e, st) {
      debugPrint('[CartNotifier][ERROR] $e');
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final cartNotifierProvider = NotifierProvider<CartNotifier, AsyncValue<Cart?>>(
  CartNotifier.new,
);

/// Alias pour compatibilité
final cartStateProvider = cartNotifierProvider;
