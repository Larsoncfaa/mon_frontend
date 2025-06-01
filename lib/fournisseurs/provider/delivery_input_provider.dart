import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../services/delivery_input_service.dart';
import '../repositories/delivery_input_repository.dart';


final deliveryInputServiceProvider = Provider<DeliveryInputService>((ref) {
  final dio = ref.watch(dioProvider); // Assurez-vous que dioProvider est défini ailleurs
  return DeliveryInputService(dio);
});

final deliveryInputRepositoryProvider =
Provider<DeliveryInputRepository>((ref) {
  return DeliveryInputRepository(ref.watch(deliveryInputServiceProvider));
});
