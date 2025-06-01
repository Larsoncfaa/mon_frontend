


import '../../models/delivery.dart';
import '../../pagination/paginated_delivery.dart';
import '../../services/delivery_service.dart';

class DeliveryRepository {
  final DeliveryService _service;

  DeliveryRepository(this._service);

  Future<PaginatedDelivery> getDeliveries({int page = 1}) {
    return _service.fetchDeliveries(page: page);
  }

  Future<Delivery> getDelivery(int id) {
    return _service.fetchDelivery(id);
  }

  Future<Delivery> createDelivery(Delivery delivery) {
    return _service.createDelivery(delivery);
  }

  Future<Delivery> updateDelivery(int id, Delivery delivery) {
    return _service.updateDelivery(id, delivery);
  }

  Future<void> deleteDelivery(int id) {
    return _service.deleteDelivery(id);
  }
}
