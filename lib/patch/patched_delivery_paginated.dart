import 'package:freezed_annotation/freezed_annotation.dart';
import 'patched_delivery.dart';

part 'patched_delivery_paginated.freezed.dart';
part 'patched_delivery_paginated.g.dart';

@freezed
class PatchedDeliveryPaginated with _$PatchedDeliveryPaginated {
  const factory PatchedDeliveryPaginated({
    int? count,
    String? next,
    String? previous,
    List<PatchedDelivery>? results,
  }) = _PatchedDeliveryPaginated;

  factory PatchedDeliveryPaginated.fromJson(Map<String, dynamic> json) =>
      _$PatchedDeliveryPaginatedFromJson(json);
}
