// 📄 user.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maliag/models/user_role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String email,
    @UserRoleConverter() required UserRole role, // rôle obligatoire
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
