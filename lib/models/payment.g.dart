// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: (json['id'] as num?)?.toInt(),
      order: (json['order'] as num).toInt(),
      method: $enumDecode(_$MethodEnumEnumMap, json['method']),
      amount: (json['amount'] as num).toDouble(),
      paymentStatus: $enumDecodeNullable(
          _$PaymentStatusEnumEnumMap, json['paymentStatus']),
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'method': _$MethodEnumEnumMap[instance.method]!,
      'amount': instance.amount,
      'paymentStatus': _$PaymentStatusEnumEnumMap[instance.paymentStatus],
      'paidAt': instance.paidAt?.toIso8601String(),
    };

const _$MethodEnumEnumMap = {
  MethodEnum.card: 'CARD',
  MethodEnum.bank: 'BANK',
  MethodEnum.mobile: 'MOBILE',
  MethodEnum.paypal: 'PAYPAL',
  MethodEnum.applePay: 'APPLE_PAY',
  MethodEnum.googlePay: 'GOOGLE_PAY',
  MethodEnum.creditCard: 'creditCard',
};

const _$PaymentStatusEnumEnumMap = {
  PaymentStatusEnum.pending: 'PENDING',
  PaymentStatusEnum.paid: 'PAID',
  PaymentStatusEnum.failed: 'FAILED',
};
