import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/cart.dart';
import '../models/cart_item.dart'; // nécessaire pour désérialiser les items

/// Service gérant les requêtes API liées au panier unique de l'utilisateur
class CartService {
  final Dio dio;

  CartService(this.dio);

  /// Récupère le panier actif (ou le crée automatiquement via le backend)
  Future<Cart?> getCart() async {
    try {
      final response = await dio.get('/cart/');
      final raw = response.data;

      // ❗️Ne pas désérialiser manuellement les items ici — `Cart.fromJson()` s'en charge
      final cart = Cart.fromJson(raw);

      return cart;
    } catch (e, st) {
      debugPrint('[CartService][ERROR] getCart: $e');
      debugPrintStack(stackTrace: st);
      return null;
    }
  }

  /// Crée un panier (rarement utilisé car /cart/ fait get_or_create)
  Future<Cart> createCart(Cart cart) async {
    try {
      final data = cart.toJson()..remove('id'); // on retire l'ID si présent
      final response = await dio.post('/carts/', data: data);
      return Cart.fromJson(response.data);
    } catch (e, st) {
      debugPrint('[CartService][ERROR] createCart: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Met à jour le panier
  Future<Cart> updateCart(Cart cart) async {
    try {
      final response = await dio.put('/cart/${cart.id}/', data: cart.toJson());
      return Cart.fromJson(response.data);
    } catch (e, st) {
      debugPrint('[CartService][ERROR] updateCart: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }

  /// Supprime un panier (rarement utilisé)
  Future<void> deleteCart(int id) async {
    try {
      await dio.delete('/cart/$id/');
    } catch (e, st) {
      debugPrint('[CartService][ERROR] deleteCart: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }
  }
}
