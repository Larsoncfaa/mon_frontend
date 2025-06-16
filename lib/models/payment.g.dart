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
      amount: const StringToDoubleConverter().fromJson(json['amount']),
      paymentStatus: $enumDecodeNullable(
          _$PaymentStatusEnumEnumMap, json['payment_status']),
      paidAt: json['paid_at'] == null
          ? null
          : DateTime.parse(json['paid_at'] as String),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'method': _$MethodEnumEnumMap[instance.method]!,
      'amount': const StringToDoubleConverter().toJson(instance.amount),
      'payment_status': _$PaymentStatusEnumEnumMap[instance.paymentStatus],
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
