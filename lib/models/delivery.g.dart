// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryImpl _$$DeliveryImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryImpl(
      id: (json['id'] as num).toInt(),
      deliverer: (json['deliverer'] as num?)?.toInt(),
      order: (json['order'] as num).toInt(),
      product: (json['product'] as num?)?.toInt(),
      type: $enumDecode(_$TypeEnumEnumMap, json['type']),
      deliveryStatus: $enumDecodeNullable(
          _$DeliveryStatusEnumEnumMap, json['deliveryStatus']),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DeliveryImplToJson(_$DeliveryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliverer': instance.deliverer,
      'order': instance.order,
      'product': instance.product,
      'type': _$TypeEnumEnumMap[instance.type]!,
      'deliveryStatus': _$DeliveryStatusEnumEnumMap[instance.deliveryStatus],
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
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
