import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_invoice.freezed.dart';
part 'patched_invoice.g.dart';

@freezed
class PatchedInvoice with _$PatchedInvoice {
  const factory PatchedInvoice({
    int? id,
    int? order,
    String? pdf,
    @JsonKey(name: 'issued_at') DateTime? issuedAt,
  }) = _PatchedInvoice;

  factory PatchedInvoice.fromJson(Map<String, dynamic> json) => _$PatchedInvoiceFromJson(json);
}
