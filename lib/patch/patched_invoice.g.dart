// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedInvoiceImpl _$$PatchedInvoiceImplFromJson(Map<String, dynamic> json) =>
    _$PatchedInvoiceImpl(
      id: (json['id'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      pdf: json['pdf'] as String?,
      issuedAt: json['issued_at'] == null
          ? null
          : DateTime.parse(json['issued_at'] as String),
    );

Map<String, dynamic> _$$PatchedInvoiceImplToJson(
        _$PatchedInvoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'pdf': instance.pdf,
      'issued_at': instance.issuedAt?.toIso8601String(),
    };
