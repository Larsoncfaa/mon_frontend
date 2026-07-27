// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_delivery_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedDeliveryPatchDto _$PatchedDeliveryPatchDtoFromJson(
  Map<String, dynamic> json,
) => _PatchedDeliveryPatchDto(
  deliverer: (json['deliverer'] as num?)?.toInt(),
  order: (json['order'] as num?)?.toInt(),
  product: (json['product'] as num?)?.toInt(),
  type: json['type'] as String?,
  deliveryStatus: json['delivery_status'] as String?,
  description: json['description'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PatchedDeliveryPatchDtoToJson(
  _PatchedDeliveryPatchDto instance,
) => <String, dynamic>{
  'deliverer': instance.deliverer,
  'order': instance.order,
  'product': instance.product,
  'type': instance.type,
  'delivery_status': instance.deliveryStatus,
  'description': instance.description,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
