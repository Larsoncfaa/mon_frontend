// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefundRequestImpl _$$RefundRequestImplFromJson(Map<String, dynamic> json) =>
    _$RefundRequestImpl(
      id: (json['id'] as num).toInt(),
      daysRemaining: (json['daysRemaining'] as num).toInt(),
      reason: json['reason'] as String,
      evidence: json['evidence'] as String,
      refundStatus:
          $enumDecode(_$RefundStatusEnumEnumMap, json['refundStatus']),
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      processedAt: json['processedAt'] == null
          ? null
          : DateTime.parse(json['processedAt'] as String),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$RefundRequestImplToJson(_$RefundRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'daysRemaining': instance.daysRemaining,
      'reason': instance.reason,
      'evidence': instance.evidence,
      'refundStatus': _$RefundStatusEnumEnumMap[instance.refundStatus]!,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'processedAt': instance.processedAt?.toIso8601String(),
      'order': instance.order,
    };

const _$RefundStatusEnumEnumMap = {
  RefundStatusEnum.pending: 'PENDING',
  RefundStatusEnum.approved: 'APPROVED',
  RefundStatusEnum.rejected: 'REJECTED',
  RefundStatusEnum.PENDING: 'PENDING',
  RefundStatusEnum.accepted: 'accepted',
  RefundStatusEnum.refused: 'refused',
  RefundStatusEnum.APPROVED: 'APPROVED',
  RefundStatusEnum.REJECTED: 'REJECTED',
};
