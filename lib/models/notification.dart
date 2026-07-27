import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    required int id,
    required String title,
    required String message,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'is_read') required bool isRead,
    String? link,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
