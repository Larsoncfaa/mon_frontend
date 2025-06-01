// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedWarehouseImpl _$$PatchedWarehouseImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedWarehouseImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$PatchedWarehouseImplToJson(
        _$PatchedWarehouseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
    };
