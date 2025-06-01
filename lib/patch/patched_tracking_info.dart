import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_tracking_info.freezed.dart';
part 'patched_tracking_info.g.dart';

@freezed
class PatchedTrackingInfo with _$PatchedTrackingInfo {
  const factory PatchedTrackingInfo({
    int? id,
    int? delivery,
    @JsonKey(name: 'tracking_status') String? trackingStatus,
    String? location,
    DateTime? timestamp,
  }) = _PatchedTrackingInfo;

  factory PatchedTrackingInfo.fromJson(Map<String, dynamic> json) =>
      _$PatchedTrackingInfoFromJson(json);
}
