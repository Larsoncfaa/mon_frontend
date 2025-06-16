// cart_item_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/cart_item.dart';
import '../../pagination/paginated_cart_item_list.dart';
import '../../services/cart_item_service.dart';
import '../notifications/cart_item_notifier.dart';
import '../repositories/cart_item_repository.dart';

/// Fournisseur du service d’accès réseau pour les éléments du panier.
final cartItemServiceProvider = Provider<CartItemService>((ref) {
  final dio = ref.watch(dioProvider);
  return CartItemService(dio);
});

/// Fournisseur du repository qui encapsule la logique métier.
final cartItemRepositoryProvider = Provider<CartItemRepository>((ref) {
  final service = ref.watch(cartItemServiceProvider);
  return CartItemRepository(service);
});

/// Fournisseur du notifier principal gérant la liste paginée des éléments du panier.
/// Utilisé dans les vues pour lire/modifier l’état.
final cartItemNotifierProvider =
StateNotifierProvider<CartItemNotifier, AsyncValue<PaginatedCartItemList>>((ref) {
  final repo = ref.watch(cartItemRepositoryProvider);
  return CartItemNotifier(repo);
});

/// Fournisseur permettant de récupérer un élément du panier par son ID.
/// Utilisé pour afficher/modifier un seul produit dans le panier.
final cartItemByIdProvider = FutureProvider.family<CartItem, int>((ref, id) async {
  final repo = ref.watch(cartItemRepositoryProvider);
  return repo.getCartItem(id);
});
