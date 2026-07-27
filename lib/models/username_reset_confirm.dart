import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_reset_confirm.freezed.dart';
part 'username_reset_confirm.g.dart';

@freezed
abstract class UsernameResetConfirm with _$UsernameResetConfirm {
  const factory UsernameResetConfirm({
    @JsonKey(name: 'new_email') required String newEmail,
    @JsonKey(name: 're_new_email') required String reNewEmail,
  }) = _UsernameResetConfirm;

  factory UsernameResetConfirm.fromJson(Map<String, dynamic> json) =>
      _$UsernameResetConfirmFromJson(json);
}
