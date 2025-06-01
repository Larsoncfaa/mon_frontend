// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_tracking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedTrackingInfoImpl _$$PatchedTrackingInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedTrackingInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      delivery: (json['delivery'] as num?)?.toInt(),
      trackingStatus: json['tracking_status'] as String?,
      location: json['location'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$PatchedTrackingInfoImplToJson(
        _$PatchedTrackingInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'tracking_status': instance.trackingStatus,
      'location': instance.location,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
