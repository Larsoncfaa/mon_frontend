// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefundRequest _$RefundRequestFromJson(Map<String, dynamic> json) =>
    _RefundRequest(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      reason: json['reason'] as String,
      requestedAt: json['requested_at'] == null
          ? null
          : DateTime.parse(json['requested_at'] as String),
      refundStatus: $enumDecodeNullable(
        _$RefundStatusEnumEnumMap,
        json['refund_status'],
      ),
      processedAt: json['processed_at'] == null
          ? null
          : DateTime.parse(json['processed_at'] as String),
      daysRemaining: (json['days_remaining'] as num).toInt(),
    );

Map<String, dynamic> _$RefundRequestToJson(_RefundRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'reason': instance.reason,
      'requested_at': instance.requestedAt?.toIso8601String(),
      'refund_status': _$RefundStatusEnumEnumMap[instance.refundStatus],
      'processed_at': instance.processedAt?.toIso8601String(),
      'days_remaining': instance.daysRemaining,
    };

const _$RefundStatusEnumEnumMap = {
  RefundStatusEnum.pending: 'PENDING',
  RefundStatusEnum.approved: 'APPROVED',
  RefundStatusEnum.rejected: 'REJECTED',
};
