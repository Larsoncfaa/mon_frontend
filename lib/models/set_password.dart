import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_password.freezed.dart';
part 'set_password.g.dart';

/// Requête pour modifier le mot de passe de l'utilisateur connecté.
@freezed
class SetPassword with _$SetPassword {
  const factory SetPassword({
    /// Nouveau mot de passe à définir
    @JsonKey(name: 'new_password') required String newPassword,

    /// Mot de passe actuel
    @JsonKey(name: 'current_password') required String currentPassword,
  }) = _SetPassword;

  /// Création à partir d’un JSON
  factory SetPassword.fromJson(Map<String, dynamic> json) => _$SetPasswordFromJson(json);
}
