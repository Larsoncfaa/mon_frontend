// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_payment_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedPaymentLog _$PatchedPaymentLogFromJson(Map<String, dynamic> json) =>
    _PatchedPaymentLog(
      id: (json['id'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      attemptTime: json['attempt_time'] == null
          ? null
          : DateTime.parse(json['attempt_time'] as String),
      responseMessage: json['response_message'] as String?,
    );

Map<String, dynamic> _$PatchedPaymentLogToJson(_PatchedPaymentLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'amount': instance.amount,
      'status': instance.status,
      'attempt_time': instance.attemptTime?.toIso8601String(),
      'response_message': instance.responseMessage,
    };
