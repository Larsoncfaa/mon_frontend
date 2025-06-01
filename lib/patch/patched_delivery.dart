import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/delivery.dart';


part 'patched_delivery.freezed.dart';
part 'patched_delivery.g.dart';


@freezed
class PatchedDelivery with _$PatchedDelivery {
  const factory PatchedDelivery({
    int? id,
    int? deliverer,
    int? order,
    int? product,
    @JsonKey(name: 'type') TypeEnum? type,
    @JsonKey(name: 'delivery_status') DeliveryStatusEnum? deliveryStatus,
    String? description,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PatchedDelivery;

  factory PatchedDelivery.fromJson(Map<String, dynamic> json) =>
      _$PatchedDeliveryFromJson(json);
}
