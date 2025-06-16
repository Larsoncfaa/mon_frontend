import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pagination/paginated_tracking_info_list.dart';
import '../repositories/tracking_info_repository.dart';

/// Notifier pour gérer les états des informations de suivi
class TrackingInfoNotifier extends StateNotifier<AsyncValue<PaginatedTrackingInfoList>> {
  final TrackingInfoRepository repository;

  int _currentPage = 1;

  TrackingInfoNotifier(this.repository) : super(const AsyncLoading()) {
    fetchTrackingInfos();
  }

  /// Charge les informations de suivi
  Future<void> fetchTrackingInfos({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchTrackingInfos(page: page);
      _currentPage = page;
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(Exception('Erreur lors du chargement des informations de suivi : $e'), st);
    }
  }

  /// Rafraîchit les données à la page actuelle
  Future<void> refresh() async {
    await fetchTrackingInfos(page: _currentPage);
  }

  /// Supprime une entrée et recharge les données
  Future<void> delete(int id) async {
    try {
      await repository.deleteTrackingInfo(id);
      await fetchTrackingInfos(page: _currentPage);
    } catch (e, st) {
      state = AsyncError(Exception('Erreur lors de la suppression de l’information de suivi : $e'), st);
    }
  }
}
