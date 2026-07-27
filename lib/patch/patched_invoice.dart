import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_invoice.freezed.dart';
part 'patched_invoice.g.dart';

@freezed
abstract class PatchedInvoice with _$PatchedInvoice {
  const factory PatchedInvoice({
    int? id,
    int? order,
    @JsonKey(name: 'issued_at') DateTime? issuedAt,
    @JsonKey(name: 'pdf_file') String? pdfFile,
  }) = _PatchedInvoice;

  factory PatchedInvoice.fromJson(Map<String, dynamic> json) =>
      _$PatchedInvoiceFromJson(json);
}
