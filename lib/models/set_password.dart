import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_password.freezed.dart';
part 'set_password.g.dart';

@freezed
abstract class SetPassword with _$SetPassword {
  const factory SetPassword({
    @JsonKey(name: 'new_password') required String newPassword,
    @JsonKey(name: 'current_password') required String currentPassword,
  }) = _SetPassword;

  factory SetPassword.fromJson(Map<String, dynamic> json) =>
      _$SetPasswordFromJson(json);
}
