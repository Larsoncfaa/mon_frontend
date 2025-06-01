import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_warehouse.freezed.dart';
part 'patched_warehouse.g.dart';

@freezed
class PatchedWarehouse with _$PatchedWarehouse {
  const factory PatchedWarehouse({
    int? id,
    String? name,
    String? location,
  }) = _PatchedWarehouse;

  factory PatchedWarehouse.fromJson(Map<String, dynamic> json) =>
      _$PatchedWarehouseFromJson(json);
}
