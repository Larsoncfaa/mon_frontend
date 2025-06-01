import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/tracking_info.dart';


part 'paginated_tracking_info_list.freezed.dart';
part 'paginated_tracking_info_list.g.dart';

@freezed
class PaginatedTrackingInfoList with _$PaginatedTrackingInfoList {
  const factory PaginatedTrackingInfoList({
    required int count,
    String? next,
    String? previous,
    required List<TrackingInfo> results,
  }) = _PaginatedTrackingInfoList;

  factory PaginatedTrackingInfoList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTrackingInfoListFromJson(json);
}
