// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryImpl _$$DeliveryImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryImpl(
      id: (json['id'] as num).toInt(),
      deliverer: (json['deliverer'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      product: (json['product'] as num?)?.toInt(),
      type: _typeEnumFromJson(json['type'] as String?),
      deliveryStatus:
          _deliveryStatusEnumFromJson(json['delivery_status'] as String?),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DeliveryImplToJson(_$DeliveryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliverer': instance.deliverer,
      'order': instance.order,
      'product': instance.product,
      'type': _$TypeEnumEnumMap[instance.type]!,
      'delivery_status': _$DeliveryStatusEnumEnumMap[instance.deliveryStatus],
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

const _$TypeEnumEnumMap = {
  TypeEnum.LIVRAISON: 'LIVRAISON',
  TypeEnum.STOCK: 'STOCK',
  TypeEnum.REMBOURSEMENT: 'REMBOURSEMENT',
  TypeEnum.AUTRE: 'AUTRE',
};

const _$DeliveryStatusEnumEnumMap = {
  DeliveryStatusEnum.EN_ATTENTE: 'EN_ATTENTE',
  DeliveryStatusEnum.EN_COURS: 'EN_COURS',
  DeliveryStatusEnum.TERMINEE: 'TERMINEE',
};
