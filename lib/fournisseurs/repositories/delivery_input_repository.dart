

import '../../models/delivery_input.dart';
import '../../services/delivery_input_service.dart';

class DeliveryInputRepository {
  final DeliveryInputService service;

  DeliveryInputRepository(this.service);

  Future<void> createInput(DeliveryInput input) {
    return service.createDeliveryInput(input);
  }

  Future<void> updateInput(int id, DeliveryInput input) {
    return service.updateDeliveryInput(id, input);
  }
}
