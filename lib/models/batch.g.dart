// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatchImpl _$$BatchImplFromJson(Map<String, dynamic> json) => _$BatchImpl(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      lotNumber: json['lot_number'] as String,
      expirationDate: DateTime.parse(json['expiration_date'] as String),
    );

Map<String, dynamic> _$$BatchImplToJson(_$BatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'lot_number': instance.lotNumber,
      'expiration_date': instance.expirationDate.toIso8601String(),
    };
