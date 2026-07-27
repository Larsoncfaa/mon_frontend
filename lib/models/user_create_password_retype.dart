import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_create_password_retype.freezed.dart';
part 'user_create_password_retype.g.dart';

@freezed
abstract class UserCreatePasswordRetype with _$UserCreatePasswordRetype {
  const factory UserCreatePasswordRetype({
    required int id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String password,
    @JsonKey(name: 're_password') required String rePassword,
  }) = _UserCreatePasswordRetype;

  factory UserCreatePasswordRetype.fromJson(Map<String, dynamic> json) =>
      _$UserCreatePasswordRetypeFromJson(json);
}
