// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentLog _$PaymentLogFromJson(Map<String, dynamic> json) => _PaymentLog(
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
  status: json['status'] as String,
  attemptTime: DateTime.parse(json['attempt_time'] as String),
  responseMessage: json['response_message'] as String?,
);

Map<String, dynamic> _$PaymentLogToJson(_PaymentLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'amount': instance.amount,
      'status': instance.status,
      'attempt_time': instance.attemptTime.toIso8601String(),
      'response_message': instance.responseMessage,
    };
