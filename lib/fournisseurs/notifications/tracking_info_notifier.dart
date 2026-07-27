import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_tracking_info_list.dart';
import '../repositories/tracking_info_repository.dart';

// Provider du repository (à adapter selon ton projet)
final trackingInfoRepositoryProvider = Provider<TrackingInfoRepository>((ref) {
  throw UnimplementedError('Initialisez votre TrackingInfoRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class TrackingInfoNotifier
    extends Notifier<AsyncValue<PaginatedTrackingInfoList>> {
  late final TrackingInfoRepository _repository;
  int _currentPage = 1;

  @override
  AsyncValue<PaginatedTrackingInfoList> build() {
    _repository = ref.watch(trackingInfoRepositoryProvider);
    fetchTrackingInfos();
    return const AsyncLoading();
  }

  /// Charge les informations de suivi
  Future<void> fetchTrackingInfos({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await _repository.fetchTrackingInfos(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(
        Exception('Erreur lors du chargement des informations de suivi : $e'),
        st,
      );
    }
  }

  /// Rafraîchit les données à la page actuelle
  Future<void> refresh() async {
    await fetchTrackingInfos(page: _currentPage);
  }

  /// Supprime une entrée et recharge les données
  Future<void> delete(int id) async {
    try {
      await _repository.deleteTrackingInfo(id);
      await fetchTrackingInfos(page: _currentPage);
    } catch (e, st) {
      state = AsyncError(
        Exception('Erreur lors de la suppression de l’information de suivi : $e'),
        st,
      );
    }
  }
}

/// Provider pour Riverpod 3.x
final trackingInfoNotifierProvider = NotifierProvider<
    TrackingInfoNotifier, AsyncValue<PaginatedTrackingInfoList>>(
  TrackingInfoNotifier.new,
);