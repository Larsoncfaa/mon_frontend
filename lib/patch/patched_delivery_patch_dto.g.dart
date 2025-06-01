// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_delivery_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedDeliveryPatchDtoImpl _$$PatchedDeliveryPatchDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedDeliveryPatchDtoImpl(
      deliverer: (json['deliverer'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      product: (json['product'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$TypeEnumEnumMap, json['type']),
      deliveryStatus: $enumDecodeNullable(
          _$DeliveryStatusEnumEnumMap, json['delivery_status']),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PatchedDeliveryPatchDtoImplToJson(
        _$PatchedDeliveryPatchDtoImpl instance) =>
    <String, dynamic>{
      'deliverer': instance.deliverer,
      'order': instance.order,
      'product': instance.product,
      'type': _$TypeEnumEnumMap[instance.type],
      'delivery_status': _$DeliveryStatusEnumEnumMap[instance.deliveryStatus],
      'description': instance.description,
    };

const _$TypeEnumEnumMap = {
  TypeEnum.livraison: 'LIVRAISON',
  TypeEnum.stock: 'STOCK',
  TypeEnum.remboursement: 'REMBOURSEMENT',
  TypeEnum.autre: 'AUTRE',
};

const _$DeliveryStatusEnumEnumMap = {
  DeliveryStatusEnum.enAttente: 'EN_ATTENTE',
  DeliveryStatusEnum.enCours: 'EN_COURS',
  DeliveryStatusEnum.terminee: 'TERMINEE',
};
