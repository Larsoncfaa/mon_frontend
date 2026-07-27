// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Warehouse _$WarehouseFromJson(Map<String, dynamic> json) => _Warehouse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  location: json['location'] as String,
);

Map<String, dynamic> _$WarehouseToJson(_Warehouse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
    };
