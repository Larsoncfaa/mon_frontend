import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_order_write.freezed.dart';
part 'patched_order_write.g.dart';

@freezed
class PatchedOrderWrite with _$PatchedOrderWrite {
  const factory PatchedOrderWrite({
    int? product,
    int? quantity,
    double? price,
    int? customer,
    String? status,
  }) = _PatchedOrderWrite;

  factory PatchedOrderWrite.fromJson(Map<String, dynamic> json) =>
      _$PatchedOrderWriteFromJson(json);
}
