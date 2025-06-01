// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingInfoImpl _$$TrackingInfoImplFromJson(Map<String, dynamic> json) =>
    _$TrackingInfoImpl(
      id: (json['id'] as num).toInt(),
      delivery: (json['delivery'] as num).toInt(),
      trackingStatus: json['trackingStatus'] as String,
      location: json['location'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$TrackingInfoImplToJson(_$TrackingInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'trackingStatus': instance.trackingStatus,
      'location': instance.location,
      'timestamp': instance.timestamp.toIso8601String(),
    };
