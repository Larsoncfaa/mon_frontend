import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_order_write.freezed.dart';
part 'patched_order_write.g.dart';

@freezed
abstract class PatchedOrderWrite with _$PatchedOrderWrite {
  const factory PatchedOrderWrite({
    int? client,
    @JsonKey(name: 'order_status') String? orderStatus,
    List<dynamic>? lines,
    double? total,
  }) = _PatchedOrderWrite;

  factory PatchedOrderWrite.fromJson(Map<String, dynamic> json) =>
      _$PatchedOrderWriteFromJson(json);
}
