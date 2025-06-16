import 'package:dio/dio.dart';
import '../models/tracking_info.dart';
import '../pagination/paginated_tracking_info_list.dart';

/// Service responsable des appels API pour les informations de suivi
class TrackingInfoService {
  final Dio dio;

  TrackingInfoService(this.dio);

  /// Récupère une page d'informations de suivi
  Future<PaginatedTrackingInfoList> fetchTrackingInfos({int page = 1}) async {
    try {
      final response = await dio.get('/tracking-info/', queryParameters: {'page': page});
      return PaginatedTrackingInfoList.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors du chargement des informations de suivi : ${e.message}');
    }
  }

  /// Récupère une information de suivi spécifique par son ID
  Future<TrackingInfo> getTrackingInfo(int id) async {
    try {
      final response = await dio.get('/tracking-info/$id/');
      return TrackingInfo.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors de la récupération de l\'information de suivi $id : ${e.message}');
    }
  }

  /// Crée une nouvelle information de suivi
  Future<TrackingInfo> createTrackingInfo(TrackingInfo info) async {
    try {
      final data = info.toJson()..remove('id');
      final response = await dio.post('/tracking-info/', data: data);
      return TrackingInfo.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors de la création d\'une information de suivi : ${e.message}');
    }
  }

  /// Met à jour une information de suivi existante
  Future<TrackingInfo> updateTrackingInfo(TrackingInfo info) async {
    try {
      final response = await dio.put('/tracking-info/${info.id}/', data: info.toJson());
      return TrackingInfo.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Erreur lors de la mise à jour de l\'information de suivi ${info.id} : ${e.message}');
    }
  }

  /// Supprime une information de suivi
  Future<void> deleteTrackingInfo(int id) async {
    try {
      await dio.delete('/tracking-info/$id/');
    } on DioException catch (e) {
      throw Exception('Erreur lors de la suppression de l\'information de suivi $id : ${e.message}');
    }
  }
}
