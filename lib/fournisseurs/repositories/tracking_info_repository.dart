

import '../../models/tracking_info.dart';
import '../../pagination/paginated_tracking_info_list.dart';
import '../../services/tracking_info_service.dart';

/// Repository qui centralise les opérations liées aux informations de suivi
class TrackingInfoRepository {
  final TrackingInfoService service;

  TrackingInfoRepository(this.service);

  Future<PaginatedTrackingInfoList> fetchTrackingInfos({int page = 1}) {
    return service.fetchTrackingInfos(page: page);
  }

  Future<TrackingInfo> getTrackingInfo(int id) {
    return service.getTrackingInfo(id);
  }

  Future<TrackingInfo> createTrackingInfo(TrackingInfo info) {
    return service.createTrackingInfo(info);
  }

  Future<TrackingInfo> updateTrackingInfo(TrackingInfo info) {
    return service.updateTrackingInfo(info);
  }

  Future<void> deleteTrackingInfo(int id) {
    return service.deleteTrackingInfo(id);
  }
}
