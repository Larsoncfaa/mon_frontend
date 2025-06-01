import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_tracking_info_list.dart';
import '../repositories/tracking_info_repository.dart';


/// Notifier pour gérer les états des informations de suivi
class TrackingInfoNotifier extends StateNotifier<AsyncValue<PaginatedTrackingInfoList>> {
  final TrackingInfoRepository repository;

  TrackingInfoNotifier(this.repository) : super(const AsyncLoading()) {
    fetchTrackingInfos();
  }

  /// Charge les informations de suivi
  Future<void> fetchTrackingInfos({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchTrackingInfos(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Supprime une entrée et recharge les données
  Future<void> deleteTrackingInfo(int id) async {
    try {
      await repository.deleteTrackingInfo(id);
      await fetchTrackingInfos();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
