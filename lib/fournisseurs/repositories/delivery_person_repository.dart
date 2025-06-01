// 📦 FICHIER : lib/repositories/delivery_person_repository.dart



import '../../models/delivery_person.dart';
import '../../services/delivery_person_service.dart';

class DeliveryPersonRepository {
  final DeliveryPersonService _service;
  DeliveryPersonRepository(this._service);

  Future<PaginatedDeliveryPersonList> fetchPage({String? url}) {
    return _service.fetchPage(url: url);
  }

  Future<DeliveryPerson> markDelivered(int id) {
    return _service.markDelivered(id);
  }

  Future<DeliveryPerson> reassign(int id, int newUserId) {
    return _service.reassign(id, newUserId);
  }
}