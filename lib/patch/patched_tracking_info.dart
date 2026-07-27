import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_tracking_info.freezed.dart';
part 'patched_tracking_info.g.dart';

@freezed
abstract class PatchedTrackingInfo with _$PatchedTrackingInfo {
  const factory PatchedTrackingInfo({
    int? id,
    int? delivery,
    double? latitude,
    double? longitude,
    String? location,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PatchedTrackingInfo;

  factory PatchedTrackingInfo.fromJson(Map<String, dynamic> json) =>
      _$PatchedTrackingInfoFromJson(json);
}
