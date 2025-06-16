import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue('agriculteur')
  agriculteur,

  @JsonValue('client')
  client,

  @JsonValue('livreur')
  livreur,
}

class UserRoleConverter implements JsonConverter<UserRole, String> {
  const UserRoleConverter();

  @override
  UserRole fromJson(String json) {
    switch (json) {
      case 'agriculteur':
        return UserRole.agriculteur;
      case 'client':
        return UserRole.client;
      case 'livreur':
        return UserRole.livreur;
      default:
        throw ArgumentError('Rôle utilisateur inconnu : $json');


    }



  }

  @override
  String toJson(UserRole role) => role.name;
}
extension UserRoleX on UserRole {
  String get label {
    switch (this) {
      case UserRole.agriculteur:
        return 'Agriculteur';
      case UserRole.client:
        return 'Client';
      case UserRole.livreur:
        return 'Livreur';
    }
  }
}