// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_tracking_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedTrackingInfo _$PatchedTrackingInfoFromJson(Map<String, dynamic> json) =>
    _PatchedTrackingInfo(
      id: (json['id'] as num?)?.toInt(),
      delivery: (json['delivery'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      location: json['location'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PatchedTrackingInfoToJson(
  _PatchedTrackingInfo instance,
) => <String, dynamic>{
  'id': instance.id,
  'delivery': instance.delivery,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'location': instance.location,
  'updated_at': instance.updatedAt?.toIso8601String(),
};
