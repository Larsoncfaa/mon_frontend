import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

class LiveLocationService {
  final Dio dio;

  LiveLocationService(this.dio);

  Future<void> sendLocation({
    required int deliveryId,
    required double latitude,
    required double longitude,
  }) async {
    try {
      await dio.post('/tracking/', data: {
        'delivery_id': deliveryId,
        'latitude': latitude,
        'longitude': longitude,
      });
    } catch (e) {
      debugPrint('Erreur lors de l\'envoi de la position : $e');
    }
  }

  Stream<Position> getLivePosition() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }
}
