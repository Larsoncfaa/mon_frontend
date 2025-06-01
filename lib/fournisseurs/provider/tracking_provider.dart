// 📁 lib/providers/tracking_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/tracking_info.dart';
import '../../services/tracking_service.dart';
import '../repositories/tracking_repository.dart';






final trackingServiceProvider = Provider<TrackingService>((ref) {
  return TrackingService(ref.watch(dioProvider));
});

final trackingRepositoryProvider = Provider<TrackingRepository>((ref) {
  return TrackingRepository(ref.watch(trackingServiceProvider));
});

/// Fournit la liste des points de suivi (avec leurs coords) pour une livraison
final trackingByDeliveryProvider = FutureProvider.family<List<TrackingInfo>, int>((ref, deliveryId) {
  return ref.watch(trackingRepositoryProvider).getByDelivery(deliveryId);
});
