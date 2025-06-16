import 'package:flutter/foundation.dart';
import '../../models/cart.dart';
import '../../services/cart_service.dart';

class CartRepository {
  final CartService service;

  CartRepository(this.service);

  /// Récupère le panier actif de l'utilisateur connecté.
  Future<Cart?> getCart() async {
    try {
      final cart = await service.getCart(); // plus besoin d'ID
      debugPrint('[CartRepository] Panier récupéré : ${cart?.id}');
      return cart;
    } catch (e, st) {
      debugPrint('[CartRepository][ERROR] getCart: $e');
      debugPrintStack(stackTrace: st);
      return null; // retourne null si erreur (ex. 404)
    }
  }

  /// Crée un nouveau panier (rarement utilisé dans ce contexte).
  Future<Cart> createCart(Cart cart) async {
    try {
      return await service.createCart(cart);
    } catch (e, st) {
      debugPrint('[CartRepository][ERROR] createCart: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Met à jour le panier (par exemple, pour appliquer une réduction).
  Future<Cart> updateCart(Cart cart) async {
    try {
      return await service.updateCart(cart);
    } catch (e, st) {
      debugPrint('[CartRepository][ERROR] updateCart: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Supprime un panier (rarement utilisé aussi).
  Future<void> deleteCart(int id) async {
    try {
      await service.deleteCart(id);
    } catch (e, st) {
      debugPrint('[CartRepository][ERROR] deleteCart: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }
}
