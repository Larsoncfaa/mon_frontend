import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/tracking_info.dart';
import '../../pagination/paginated_tracking_info_list.dart';
import '../../services/tracking_info_service.dart';
import '../repositories/tracking_info_repository.dart';

/// 1. Service Provider
final trackingInfoServiceProvider = Provider<TrackingInfoService>((ref) {
  return TrackingInfoService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final trackingInfoRepositoryProvider = Provider<TrackingInfoRepository>((ref) {
  return TrackingInfoRepository(ref.watch(trackingInfoServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class TrackingInfoNotifier
    extends Notifier<AsyncValue<PaginatedTrackingInfoList>> {
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedTrackingInfoList> build() {
    Future.microtask(() => fetchTrackingInfos());
    return const AsyncLoading();
  }

  /// Charge les informations de suivi
  Future<void> fetchTrackingInfos({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(trackingInfoRepositoryProvider);
      final result = await repository.fetchTrackingInfos(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Rafraîchit les données à la page actuelle
  Future<void> refresh() async {
    await fetchTrackingInfos(page: _currentPage);
  }

  /// Supprime une entrée et recharge les données
  Future<void> delete(int id) async {
    try {
      final repository = ref.read(trackingInfoRepositoryProvider);
      await repository.deleteTrackingInfo(id);
      await fetchTrackingInfos(page: _currentPage);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final trackingInfoNotifierProvider = NotifierProvider<
    TrackingInfoNotifier, AsyncValue<PaginatedTrackingInfoList>>(
  TrackingInfoNotifier.new,
);

/// 4. Fournisseur d’un suivi par ID
final trackingInfoByIdProvider =
FutureProvider.family<TrackingInfo, int>((ref, id) async {
  final repo = ref.watch(trackingInfoRepositoryProvider);
  return repo.getTrackingInfo(id);
});
