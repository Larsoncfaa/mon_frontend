import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/cart.dart';
import '../repositories/cart_repository.dart';

// Provider du repository (à ajuster selon la structure de ton projet)
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  throw UnimplementedError('Initialisez votre CartRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class CartNotifier extends Notifier<AsyncValue<Cart?>> {
  late final CartRepository _repository;

  @override
  AsyncValue<Cart?> build() {
    _repository = ref.watch(cartRepositoryProvider);
    loadCart();
    return const AsyncLoading();
  }

  Future<void> loadCart() async {
    state = const AsyncLoading();
    try {
      final cart = await _repository.getCart();
      if (cart == null) {
        state = AsyncError('Aucun panier disponible', StackTrace.current);
      } else {
        state = AsyncData(cart);
      }
    } catch (e, st) {
      debugPrint('[CartNotifier][ERROR] $e');
      debugPrintStack(stackTrace: st);
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final cartNotifierProvider =
NotifierProvider<CartNotifier, AsyncValue<Cart?>>(CartNotifier.new);