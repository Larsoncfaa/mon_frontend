import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/order.dart';
import '../pagination/paginated_order_list.dart';

class OrderService {
  final Dio dio;

  OrderService(this.dio);

  Future<PaginatedOrderList> fetchOrders({int page = 1}) async {
    try {
      final response = await dio.get('/orders/', queryParameters: {'page': page});
      debugPrint("✅ Réponse brute fetchOrders : ${response.data}");

      final results = response.data['results'] as List<dynamic>?;

      if (results != null) {
        for (int i = 0; i < results.length; i++) {
          final raw = results[i];
          try {
            final order = Order.fromJson(raw);
            debugPrint("🟢 Order[$i] ok: ID = ${order.id}, Total = ${order.total}");
          } catch (e, stack) {
            debugPrint("❌ Erreur Order.fromJson[$i] : $e");
            debugPrint("🪵 Données fautives : $raw");
          }
        }
      }

      return PaginatedOrderList.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("❌ Erreur Dio fetchOrders : ${e.response?.data}");
      rethrow;
    } catch (e, stack) {
      debugPrint("❌ Erreur générique fetchOrders : $e");
      debugPrint("🧱 Stack trace : $stack");
      rethrow;
    }
  }

  Future<Order> getOrder(int id) async {
    try {
      final response = await dio.get('/orders/$id/');
      debugPrint("✅ Réponse getOrder : ${response.data}");
      return Order.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("❌ Erreur Dio getOrder : ${e.response?.data}");
      rethrow;
    } catch (e, stack) {
      debugPrint("❌ Erreur générique getOrder : $e");
      debugPrint("🧱 Stack trace : $stack");
      rethrow;
    }
  }

  Future<Order> createOrder(Order order) async {
    try {
      final data = order.toJson()..remove('id');
      debugPrint("📤 Données envoyées createOrder : $data");
      final response = await dio.post('/orders/', data: data);
      debugPrint("✅ Réponse createOrder : ${response.data}");
      return Order.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("❌ Erreur Dio createOrder : ${e.response?.data}");
      rethrow;
    } catch (e, stack) {
      debugPrint("❌ Erreur générique createOrder : $e");
      debugPrint("🧱 Stack trace : $stack");
      rethrow;
    }
  }

  Future<Order> updateOrder(Order order) async {
    try {
      final data = order.toJson();
      debugPrint("📤 Données envoyées updateOrder : $data");
      final response = await dio.put('/orders/${order.id}/', data: data);
      debugPrint("✅ Réponse updateOrder : ${response.data}");
      return Order.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("❌ Erreur Dio updateOrder : ${e.response?.data}");
      rethrow;
    } catch (e, stack) {
      debugPrint("❌ Erreur générique updateOrder : $e");
      debugPrint("🧱 Stack trace : $stack");
      rethrow;
    }
  }

  Future<void> deleteOrder(int id) async {
    try {
      await dio.delete('/orders/$id/');
      debugPrint("🗑️ Commande supprimée : $id");
    } on DioError catch (e) {
      debugPrint("❌ Erreur Dio deleteOrder : ${e.response?.data}");
      rethrow;
    } catch (e, stack) {
      debugPrint("❌ Erreur générique deleteOrder : $e");
      debugPrint("🧱 Stack trace : $stack");
      rethrow;
    }
  }

  Future<Order> createOrderFromCart() async {
    try {
      final response = await dio.post('/orders/create-from-cart/');
      debugPrint("✅ Réponse createOrderFromCart : ${response.data}");

      try {
        final order = Order.fromJson(response.data);
        debugPrint("🟢 Order créé depuis le panier : ID = ${order.id}, Total = ${order.total}");
        return order;
      } catch (e, stack) {
        debugPrint("❌ Erreur Order.fromJson create-from-cart : $e");
        debugPrint("🪵 Données : ${response.data}");
        debugPrint("🧱 Stack trace : $stack");
        rethrow;
      }
    } on DioError catch (e) {
      debugPrint("❌ Erreur Dio createOrderFromCart : ${e.response?.data}");
      rethrow;
    } catch (e, stack) {
      debugPrint("❌ Erreur générique createOrderFromCart : $e");
      debugPrint("🧱 Stack trace : $stack");
      rethrow;
    }
  }
}
