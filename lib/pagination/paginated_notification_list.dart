import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/notification.dart';


part 'paginated_notification_list.freezed.dart';
part 'paginated_notification_list.g.dart';

@freezed
class PaginatedNotificationList with _$PaginatedNotificationList {
  const factory PaginatedNotificationList({
    required int count,
    String? next,
    String? previous,
    required List<Notification> results,
  }) = _PaginatedNotificationList;

  factory PaginatedNotificationList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedNotificationListFromJson(json);
}
