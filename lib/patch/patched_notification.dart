import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_notification.freezed.dart';
part 'patched_notification.g.dart';

@freezed
abstract class PatchedNotification with _$PatchedNotification {
  const factory PatchedNotification({
    int? id,
    String? title,
    String? message,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'is_read') bool? isRead,
    String? link,
  }) = _PatchedNotification;

  factory PatchedNotification.fromJson(Map<String, dynamic> json) =>
      _$PatchedNotificationFromJson(json);
}
