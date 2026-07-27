import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_info.freezed.dart';
part 'tracking_info.g.dart';

@freezed
abstract class TrackingInfo with _$TrackingInfo {
  const factory TrackingInfo({
    required int id,
    required int delivery,
    required double latitude,
    required double longitude,
    required String location,
    required String status,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TrackingInfo;

  factory TrackingInfo.fromJson(Map<String, dynamic> json) =>
      _$TrackingInfoFromJson(json);
}
