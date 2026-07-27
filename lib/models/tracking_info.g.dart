// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackingInfo _$TrackingInfoFromJson(Map<String, dynamic> json) =>
    _TrackingInfo(
      id: (json['id'] as num).toInt(),
      delivery: (json['delivery'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      location: json['location'] as String,
      status: json['status'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TrackingInfoToJson(_TrackingInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
      'status': instance.status,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
