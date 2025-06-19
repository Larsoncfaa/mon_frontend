import 'package:flutter/foundation.dart';
import '../../models/delivery_person.dart';
import '../../pagination/paginated_delivery_person_list.dart';
import '../../services/delivery_person_service.dart';

class DeliveryPersonRepository {
  final DeliveryPersonService _service;

  DeliveryPersonRepository(this._service);

  /// 🔄 Récupère une page de livreurs
  Future<PaginatedDeliveryPersonList> fetchPage({String? url}) async {
    try {
      debugPrint('📥 [Repository] fetchPage...');
      final result = await _service.fetchPage(url: url);
      debugPrint('✅ [Repository] fetchPage terminé avec ${result.results.length} résultats.');
      return result;
    } catch (e) {
      debugPrint('❌ [Repository] Erreur fetchPage: $e');
      rethrow;
    }
  }

  /// ✅ Marque un livreur comme ayant livré
  Future<DeliveryPerson> markDelivered(int id) async {
    try {
      debugPrint('📥 [Repository] markDelivered pour ID $id...');
      final result = await _service.markDelivered(id);
      debugPrint('✅ [Repository] markDelivered terminé.');
      return result;
    } catch (e) {
      debugPrint('❌ [Repository] Erreur markDelivered: $e');
      rethrow;
    }
  }

  /// 🔁 Réassigner un livreur à un autre utilisateur
  Future<DeliveryPerson> reassign(int id, int newUserId) async {
    try {
      debugPrint('📥 [Repository] reassign $id -> $newUserId...');
      final result = await _service.reassign(id, newUserId);
      debugPrint('✅ [Repository] reassign terminé.');
      return result;
    } catch (e) {
      debugPrint('❌ [Repository] Erreur reassign: $e');
      rethrow;
    }
  }
  Future<void> create(Map<String, dynamic> data) {
    return _service.createDeliveryPerson(data);
  }
  Future<void> delete(int id) {
    return _service.delete(id);
  }

}
