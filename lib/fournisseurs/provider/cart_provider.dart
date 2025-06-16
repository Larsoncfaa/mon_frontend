import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/cart.dart';
import '../../services/cart_service.dart';
import '../notifications/cart_notifier.dart';
import '../repositories/cart_repository.dart';

/// Fournisseur du service CartService (Dio)
final cartServiceProvider = Provider<CartService>((ref) {
  final dio = ref.watch(dioProvider);
  return CartService(dio);
});

/// Fournisseur du dépôt CartRepository
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final service = ref.watch(cartServiceProvider);
  return CartRepository(service);
});

/// Fournisseur de l’état du panier actif
final cartStateProvider =
StateNotifierProvider<CartStateNotifier, AsyncValue<Cart?>>((ref) {
  final repo = ref.watch(cartRepositoryProvider);
  return CartStateNotifier(repo);
});
