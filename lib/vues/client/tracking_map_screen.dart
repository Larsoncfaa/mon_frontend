// 📦 lib/screens/client/tracking_map_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../widgets/client_drawer_widget.dart';

class TrackingMapScreen extends ConsumerStatefulWidget {
  final int deliveryId;
  final double? latitude;
  final double? longitude;

  const TrackingMapScreen({
    super.key,
    required this.deliveryId,
    this.latitude,
    this.longitude,
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
      _updatePosition(initialPos);
    }
    _startTracking();
  }

  void _startTracking() {
    _timer = Timer.periodic(const Duration(seconds: 10), (_) => _fetchLatestPosition());
  }

  void _updatePosition(LatLng newPos) {
    if (_path.isEmpty || _path.last != newPos) {
      setState(() {
        _currentPosition = newPos;
        _path.add(newPos);
        _livreurMarker = _buildMarker(newPos);
      });

      _mapController?.animateCamera(CameraUpdate.newLatLng(newPos));
    }
  }

  Marker _buildMarker(LatLng pos) {
    return Marker(
      markerId: const MarkerId('livreur'),
      position: pos,
      infoWindow: const InfoWindow(title: 'Livreur'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
  }

  Future<void> _fetchLatestPosition() async {
    final dio = ref.read(dioProvider);
    try {
      final response = await dio.get('/tracking/${widget.deliveryId}/latest/');
      final data = response.data;
      final lat = data['latitude'];
      final lng = data['longitude'];

      if (lat != null && lng != null) {
        final newPos = LatLng(lat, lng);
        _updatePosition(newPos);
      }
    } catch (e) {
      debugPrint('Erreur lors de la récupération de la position : $e');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Suivi de la livraison")),
      drawer: ClientDrawerWidget(
        deliveryId: widget.deliveryId,
        latitude: widget.latitude,
        longitude: widget.longitude,
      ),
      body: _currentPosition != null
          ? GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition!,
          zoom: 14.5,
        ),
        markers: {
          if (_livreurMarker != null) _livreurMarker!,
        },
        polylines: {
          if (_path.length >= 2)
            Polyline(
              polylineId: const PolylineId('livreur_path'),
              color: Colors.blueAccent,
              width: 5,
              points: _path,
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
