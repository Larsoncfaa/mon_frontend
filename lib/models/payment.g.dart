// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
  method: $enumDecode(_$MethodEnumEnumMap, json['method']),
  paymentStatus: $enumDecode(
    _$PaymentStatusEnumEnumMap,
    json['payment_status'],
  ),
  transactionId: json['transaction_id'] as String?,
  paidAt: json['paid_at'] == null
      ? null
      : DateTime.parse(json['paid_at'] as String),
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'amount': instance.amount,
  'method': _$MethodEnumEnumMap[instance.method]!,
  'payment_status': _$PaymentStatusEnumEnumMap[instance.paymentStatus]!,
  'transaction_id': instance.transactionId,
  'paid_at': instance.paidAt?.toIso8601String(),
};

const _$MethodEnumEnumMap = {
  MethodEnum.card: 'CARD',
  MethodEnum.bank: 'BANK',
  MethodEnum.mobile: 'MOBILE',
  MethodEnum.paypal: 'PAYPAL',
  MethodEnum.applePay: 'APPLE_PAY',
  MethodEnum.googlePay: 'GOOGLE_PAY',
  MethodEnum.balance: 'BALANCE',
};

const _$PaymentStatusEnumEnumMap = {
  PaymentStatusEnum.pending: 'PENDING',
  PaymentStatusEnum.paid: 'PAID',
  PaymentStatusEnum.failed: 'FAILED',
};
