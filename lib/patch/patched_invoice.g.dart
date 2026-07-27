// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedInvoice _$PatchedInvoiceFromJson(Map<String, dynamic> json) =>
    _PatchedInvoice(
      id: (json['id'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
      issuedAt: json['issued_at'] == null
          ? null
          : DateTime.parse(json['issued_at'] as String),
      pdfFile: json['pdf_file'] as String?,
    );

Map<String, dynamic> _$PatchedInvoiceToJson(_PatchedInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'issued_at': instance.issuedAt?.toIso8601String(),
      'pdf_file': instance.pdfFile,
    };
