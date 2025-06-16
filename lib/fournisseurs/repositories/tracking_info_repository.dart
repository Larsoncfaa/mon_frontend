import '../../models/tracking_info.dart';
import '../../pagination/paginated_tracking_info_list.dart';
import '../../services/tracking_info_service.dart';

/// Repository qui centralise les opérations liées aux informations de suivi
class TrackingInfoRepository {
  final TrackingInfoService service;

  TrackingInfoRepository(this.service);

  Future<PaginatedTrackingInfoList> fetchTrackingInfos({int page = 1}) async {
    try {
      return await service.fetchTrackingInfos(page: page);
    } catch (e) {
      throw Exception('Erreur lors du chargement des informations de suivi (page $page) : $e');
    }
  }

  Future<TrackingInfo> getTrackingInfo(int id) async {
    try {
      return await service.getTrackingInfo(id);
    } catch (e) {
      throw Exception('Erreur lors de la récupération de l\'information de suivi $id : $e');
    }
  }

  Future<TrackingInfo> createTrackingInfo(TrackingInfo info) async {
    try {
      return await service.createTrackingInfo(info);
    } catch (e) {
      throw Exception('Erreur lors de la création de l\'information de suivi : $e');
    }
  }

  Future<TrackingInfo> updateTrackingInfo(TrackingInfo info) async {
    try {
      return await service.updateTrackingInfo(info);
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour de l\'information de suivi ${info.id} : $e');
    }
  }

  Future<void> deleteTrackingInfo(int id) async {
    try {
      await service.deleteTrackingInfo(id);
    } catch (e) {
      throw Exception('Erreur lors de la suppression de l\'information de suivi $id : $e');
    }
  }
}
