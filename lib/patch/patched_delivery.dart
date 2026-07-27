import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_delivery.freezed.dart';
part 'patched_delivery.g.dart';

@freezed
abstract class PatchedDelivery with _$PatchedDelivery {
  const factory PatchedDelivery({
    int? id,
    int? deliverer,
    int? order,
    int? product,
    String? type,
    @JsonKey(name: 'delivery_status') String? deliveryStatus,
    String? description,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    double? latitude,
    double? longitude,
  }) = _PatchedDelivery;

  factory PatchedDelivery.fromJson(Map<String, dynamic> json) =>
      _$PatchedDeliveryFromJson(json);
}
