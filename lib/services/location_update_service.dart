import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

class LocationUpdateService {
  final Dio _dio;

  LocationUpdateService(this._dio);

  Future<void> updatePosition(int deliveryId) async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      await _dio.patch('/deliveries/$deliveryId/', data: {
        'latitude': position.latitude,
        'longitude': position.longitude,
      });

      debugPrint('📍 Position envoyée : ${position.latitude}, ${position.longitude}');
    } catch (e) {
      debugPrint('❌ Erreur envoi position : $e');
    }
  }
}
