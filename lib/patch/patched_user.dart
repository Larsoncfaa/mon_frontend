import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_user.freezed.dart';
part 'patched_user.g.dart';

@freezed
abstract class PatchedUser with _$PatchedUser {
  const factory PatchedUser({
    int? id,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? role,
  }) = _PatchedUser;

  factory PatchedUser.fromJson(Map<String, dynamic> json) =>
      _$PatchedUserFromJson(json);
}
