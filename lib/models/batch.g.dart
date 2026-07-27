// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Batch _$BatchFromJson(Map<String, dynamic> json) => _Batch(
  id: (json['id'] as num).toInt(),
  product: (json['product'] as num).toInt(),
  lotNumber: json['lot_number'] as String,
  expirationDate: DateTime.parse(json['expiration_date'] as String),
);

Map<String, dynamic> _$BatchToJson(_Batch instance) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'lot_number': instance.lotNumber,
  'expiration_date': instance.expirationDate.toIso8601String(),
};
