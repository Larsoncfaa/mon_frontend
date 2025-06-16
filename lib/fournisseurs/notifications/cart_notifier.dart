import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/cart.dart';
import '../repositories/cart_repository.dart';

class CartStateNotifier extends StateNotifier<AsyncValue<Cart?>> {
  final CartRepository repository;

  CartStateNotifier(this.repository) : super(const AsyncLoading()) {
    loadCart();
  }

  Future<void> loadCart() async {
    state = const AsyncLoading();
    try {
      final cart = await repository.getCart();
      if (cart == null) {
        state = AsyncError('Aucun panier disponible', StackTrace.current);
      } else {
        state = AsyncData(cart);
      }
    } catch (e, st) {
      debugPrint('[CartStateNotifier][ERROR] $e');
      debugPrintStack(stackTrace: st);
      state = AsyncError(e, st);
    }
  }
}

