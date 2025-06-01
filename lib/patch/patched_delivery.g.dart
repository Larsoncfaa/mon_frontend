// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedDeliveryImpl _$$PatchedDeliveryImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedDeliveryImpl(
      id: (json['id'] as num?)?.toInt(),
      deliverer: (json['deliverer'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      product: (json['product'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$TypeEnumEnumMap, json['type']),
      deliveryStatus: $enumDecodeNullable(
          _$DeliveryStatusEnumEnumMap, json['delivery_status']),
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PatchedDeliveryImplToJson(
        _$PatchedDeliveryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliverer': instance.deliverer,
      'order': instance.order,
      'product': instance.product,
      'type': _$TypeEnumEnumMap[instance.type],
      'delivery_status': _$DeliveryStatusEnumEnumMap[instance.deliveryStatus],
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
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
