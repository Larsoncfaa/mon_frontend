// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      pdf: json['pdf'] as String,
      issuedAt: DateTime.parse(json['issuedAt'] as String),
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'pdf': instance.pdf,
      'issuedAt': instance.issuedAt.toIso8601String(),
    };
