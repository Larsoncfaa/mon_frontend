

import '../../models/tracking_info.dart';
import '../../services/tracking_service.dart';

class TrackingRepository {
  final TrackingService _service;

  TrackingRepository(this._service);

  /// Retourne la liste des points de suivi pour la livraison.
  Future<List<TrackingInfo>> getByDelivery(int deliveryId) {
    return _service.fetchTracking(deliveryId);
  }
}
