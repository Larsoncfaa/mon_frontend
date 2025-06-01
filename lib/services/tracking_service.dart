import 'package:dio/dio.dart';
import '../models/tracking_info.dart';

class TrackingService {
  final Dio _dio;

  TrackingService(this._dio);

  /// Récupère la liste des points de suivi pour une livraison donnée.
  Future<List<TrackingInfo>> fetchTracking(int deliveryId) async {
    final response = await _dio.get('/v1/deliveries/$deliveryId/tracking/');
    final data = response.data as List<dynamic>;
    return data
        .map((json) => TrackingInfo.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
