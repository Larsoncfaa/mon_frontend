import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_reset.freezed.dart';
part 'send_email_reset.g.dart';

@freezed
abstract class SendEmailReset with _$SendEmailReset {
  const factory SendEmailReset({
    required String email,
  }) = _SendEmailReset;

  factory SendEmailReset.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResetFromJson(json);
}
