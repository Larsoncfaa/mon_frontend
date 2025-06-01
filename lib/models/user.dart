import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole {
  agriculteur,
  client,
  livreur,
}

UserRole? roleFromString(String? role) {
  switch (role?.toLowerCase()) {
    case 'agriculteur':
      return UserRole.agriculteur;
    case 'client':
      return UserRole.client;
    case 'livreur':
      return UserRole.livreur;
    default:
      return null;
  }
}

String? roleToJson(UserRole? role) => role?.name;

/// Modèle représentant un utilisateur.
@freezed
class User with _$User {
  const factory User({
    required String email,
    String? firstName,
    String? lastName,
    required int id,
    UserRole? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}

