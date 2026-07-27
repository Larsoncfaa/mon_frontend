import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_delivery_patch_dto.freezed.dart';
part 'patched_delivery_patch_dto.g.dart';

@freezed
abstract class PatchedDeliveryPatchDto with _$PatchedDeliveryPatchDto {
  const factory PatchedDeliveryPatchDto({
    int? deliverer,
    int? order,
    int? product,
    String? type,
    @JsonKey(name: 'delivery_status') String? deliveryStatus,
    String? description,
    double? latitude,
    double? longitude,
  }) = _PatchedDeliveryPatchDto;

  factory PatchedDeliveryPatchDto.fromJson(Map<String, dynamic> json) =>
      _$PatchedDeliveryPatchDtoFromJson(json);
}
