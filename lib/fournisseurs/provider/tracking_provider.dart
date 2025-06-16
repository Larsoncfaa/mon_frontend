// 📁 lib/providers/tracking_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/tracking_info.dart';
import '../../services/tracking_service.dart';
import '../repositories/tracking_repository.dart';

/// Fournisseur du service avec gestion d’erreur
final trackingServiceProvider = Provider<TrackingService>((ref) {
  try {
    return TrackingService(ref.watch(dioProvider));
  } catch (e) {
    throw Exception('Erreur lors de la création de TrackingService: $e');
  }
});

/// Fournisseur du repository avec gestion d’erreur
final trackingRepositoryProvider = Provider<TrackingRepository>((ref) {
  try {
    return TrackingRepository(ref.watch(trackingServiceProvider));
  } catch (e) {
    throw Exception('Erreur lors de la création de TrackingRepository: $e');
  }
});

/// Fournit la liste des points de suivi (avec leurs coords) pour une livraison
final trackingByDeliveryProvider =
FutureProvider.family<List<TrackingInfo>, int>((ref, deliveryId) async {
  try {
    return await ref.watch(trackingRepositoryProvider).getByDelivery(deliveryId);
  } catch (e, st) {
    throw AsyncError(e, st);
  }
});
