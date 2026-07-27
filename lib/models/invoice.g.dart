// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Invoice _$InvoiceFromJson(Map<String, dynamic> json) => _Invoice(
  id: (json['id'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  issuedAt: DateTime.parse(json['issued_at'] as String),
  pdfFile: json['pdf_file'] as String?,
);

Map<String, dynamic> _$InvoiceToJson(_Invoice instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'issued_at': instance.issuedAt.toIso8601String(),
  'pdf_file': instance.pdfFile,
};
