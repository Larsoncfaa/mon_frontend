import 'package:dio/dio.dart';
import '../models/tracking_info.dart';
import '../pagination/paginated_tracking_info_list.dart';

/// Service responsable des appels API pour les informations de suivi
class TrackingInfoService {
  final Dio dio;

  TrackingInfoService(this.dio);

  /// Récupère une page d'informations de suivi
  Future<PaginatedTrackingInfoList> fetchTrackingInfos({int page = 1}) async {
    final response = await dio.get('/v1/tracking-info/', queryParameters: {'page': page});
    return PaginatedTrackingInfoList.fromJson(response.data);
  }

  /// Récupère une information de suivi spécifique par son ID
  Future<TrackingInfo> getTrackingInfo(int id) async {
    final response = await dio.get('/v1/tracking-info/$id/');
    return TrackingInfo.fromJson(response.data);
  }

  /// Crée une nouvelle information de suivi
  Future<TrackingInfo> createTrackingInfo(TrackingInfo info) async {
    final data = info.toJson()..remove('id');
    final response = await dio.post('/v1/tracking-info/', data: data);
    return TrackingInfo.fromJson(response.data);
  }

  /// Met à jour une information de suivi existante
  Future<TrackingInfo> updateTrackingInfo(TrackingInfo info) async {
    final response = await dio.put('/v1/tracking-info/${info.id}/', data: info.toJson());
    return TrackingInfo.fromJson(response.data);
  }

  /// Supprime une information de suivi
  Future<void> deleteTrackingInfo(int id) async {
    await dio.delete('/v1/tracking-info/$id/');
  }
}
