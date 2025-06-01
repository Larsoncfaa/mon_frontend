import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_notification.freezed.dart';
part 'patched_notification.g.dart';

@freezed
class PatchedNotification with _$PatchedNotification {
  const factory PatchedNotification({
    int? id,
    int? user,
    String? message,
    String? link,
    bool? read,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PatchedNotification;

  factory PatchedNotification.fromJson(Map<String, dynamic> json) =>
      _$PatchedNotificationFromJson(json);
}
