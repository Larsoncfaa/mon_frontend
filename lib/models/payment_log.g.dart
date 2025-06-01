// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentLogImpl _$$PaymentLogImplFromJson(Map<String, dynamic> json) =>
    _$PaymentLogImpl(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      attemptTime: DateTime.parse(json['attempt_time'] as String),
      paymentStatus: json['payment_status'] as String,
      amount: (json['amount'] as num).toDouble(),
      info: json['info'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentLogImplToJson(_$PaymentLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'attempt_time': instance.attemptTime.toIso8601String(),
      'payment_status': instance.paymentStatus,
      'amount': instance.amount,
      'info': instance.info,
    };
