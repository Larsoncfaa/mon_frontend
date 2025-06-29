import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';

class TrackingMapScreen extends ConsumerStatefulWidget {
  final int deliveryId;
  final double? latitude;
  final double? longitude;
  final double? destinationLatitude;
  final double? destinationLongitude;

  const TrackingMapScreen({
    super.key,
    required this.deliveryId,
    this.latitude,
    this.longitude,
    this.destinationLatitude,
    this.destinationLongitude,
  });

  @override
  ConsumerState<TrackingMapScreen> createState() => _TrackingMapScreenState();
}

class _TrackingMapScreenState extends ConsumerState<TrackingMapScreen> {
  GoogleMapController? _mapController;
  Timer? _timer;
  LatLng? _currentPosition;
  List<LatLng> _path = [];
  Marker? _livreurMarker;

  @override
  void initState() {
    super.initState();
    if (widget.latitude != null && widget.longitude != null) {
      final initialPos = LatLng(widget.latitude!, widget.longitude!);
      _currentPosition = initialPos;
      _path.add(initialPos);
      _livreurMarker = _buildMarker(initialPos);
      _startTracking();
    }
  }

  void _startTracking() {
    _timer = Timer.periodic(const Duration(seconds: 10), (_) => _fetchPosition());
  }

  Marker _buildMarker(LatLng pos) {
    return Marker(
      markerId: const MarkerId('livreur'),
      position: pos,
      infoWindow: const InfoWindow(title: 'Livreur'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
  }

  Marker _buildDestinationMarker(LatLng pos) {
    return Marker(
      markerId: const MarkerId('destination'),
      position: pos,
      infoWindow: const InfoWindow(title: 'Destination client'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
  }

  Future<void> _fetchPosition() async {
    final dio = ref.read(dioProvider);
    try {
      final response = await dio.get('/deliveries/${widget.deliveryId}/');
      final data = response.data;
      final lat = data['latitude'];
      final lng = data['longitude'];

      if (lat != null && lng != null) {
        final newPos = LatLng(lat, lng);
        if (_path.isEmpty || _path.last != newPos) {
          setState(() {
            _currentPosition = newPos;
            _path.add(newPos);
            _livreurMarker = _buildMarker(newPos);
          });

          _mapController?.animateCamera(CameraUpdate.newLatLng(newPos));
        }
      }
    } catch (e) {
      debugPrint('Erreur récupération position : $e');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final destinationPos = (widget.destinationLatitude != null && widget.destinationLongitude != null)
        ? LatLng(widget.destinationLatitude!, widget.destinationLongitude!)
        : null;

    final destinationMarker = destinationPos != null ? _buildDestinationMarker(destinationPos) : null;

    return Scaffold(
      appBar: AppBar(title: const Text("Suivi de la livraison")),
      body: _currentPosition != null
          ? GoogleMap(
        initialCameraPosition: CameraPosition(target: _currentPosition!, zoom: 14.5),
        markers: {
          if (_livreurMarker != null) _livreurMarker!,
          if (destinationMarker != null) destinationMarker,
        },
        polylines: {
          if (_path.length >= 2)
            Polyline(
              polylineId: const PolylineId('livreur_path'),
              color: Colors.blueAccent,
              width: 5,
              points: _path,
            ),
          if (_currentPosition != null && destinationPos != null)
            Polyline(
              polylineId: const PolylineId('to_destination'),
              color: Colors.green,
              width: 4,
              points: [_currentPosition!, destinationPos],
              patterns: [PatternItem.dash(20), PatternItem.gap(10)],
            ),
        },
        onMapCreated: (controller) {
          _mapController = controller;
        },
      )
          : const Center(child: Text("Position du livreur indisponible.")),
    );
  }
}
