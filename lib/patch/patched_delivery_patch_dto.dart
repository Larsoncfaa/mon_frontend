import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/delivery_status_enum.dart';
import '../models/type_enum.dart';



part 'patched_delivery_patch_dto.freezed.dart';
part 'patched_delivery_patch_dto.g.dart';


@freezed
class PatchedDeliveryPatchDto with _$PatchedDeliveryPatchDto {
  const factory PatchedDeliveryPatchDto({
    int? deliverer,
    int? order,
    int? product,
    @JsonKey(name: 'type') TypeEnum? type,
    @JsonKey(name: 'delivery_status') DeliveryStatusEnum? deliveryStatus,
    String? description,
  }) = _PatchedDeliveryPatchDto;

  factory PatchedDeliveryPatchDto.fromJson(Map<String, dynamic> json) =>
      _$PatchedDeliveryPatchDtoFromJson(json);
}
