import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_user.freezed.dart';
part 'patched_user.g.dart';

/// Modèle partiel pour mise à jour d'utilisateur (PATCH).
@freezed
class PatchedUser with _$PatchedUser {
  const factory PatchedUser({
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    int? id,
  }) = _PatchedUser;

  factory PatchedUser.fromJson(Map<String, dynamic> json) => _$PatchedUserFromJson(json);
}
