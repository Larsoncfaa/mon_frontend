import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
abstract class Invoice with _$Invoice {
  const factory Invoice({
    required int id,
    required int order,
    @JsonKey(name: 'issued_at') required DateTime issuedAt,
    @JsonKey(name: 'pdf_file') String? pdfFile,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}
