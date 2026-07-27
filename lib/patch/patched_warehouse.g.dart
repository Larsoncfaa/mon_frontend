// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedWarehouse _$PatchedWarehouseFromJson(Map<String, dynamic> json) =>
    _PatchedWarehouse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$PatchedWarehouseToJson(_PatchedWarehouse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
    };
