import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/tracking_info.dart';
import '../../pagination/paginated_tracking_info_list.dart';
import '../../services/tracking_info_service.dart';
import '../notifications/tracking_info_notifier.dart';
import '../repositories/tracking_info_repository.dart';



/// Fournisseur du service
final trackingInfoServiceProvider = Provider<TrackingInfoService>((ref) {
  final dio = ref.watch(dioProvider);
  return TrackingInfoService(dio);
});

/// Fournisseur du repository
final trackingInfoRepositoryProvider = Provider<TrackingInfoRepository>((ref) {
  final service = ref.watch(trackingInfoServiceProvider);
  return TrackingInfoRepository(service);
});

/// Fournisseur du notifier principal
final trackingInfoNotifierProvider = StateNotifierProvider<TrackingInfoNotifier, AsyncValue<PaginatedTrackingInfoList>>((ref) {
  final repository = ref.watch(trackingInfoRepositoryProvider);
  return TrackingInfoNotifier(repository);
});

/// Fournisseur d’un suivi par ID
final trackingInfoByIdProvider = FutureProvider.family<TrackingInfo, int>((ref, id) async {
  final repo = ref.watch(trackingInfoRepositoryProvider);
  return repo.getTrackingInfo(id);
});
