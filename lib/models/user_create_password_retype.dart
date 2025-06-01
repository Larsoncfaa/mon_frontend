import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_create_password_retype.freezed.dart';
part 'user_create_password_retype.g.dart';

/// Modèle représentant un utilisateur avec mot de passe et re-saisie pour la création de compte.
/// Ce modèle est utilisé lors d’une inscription ou d’un changement de mot de passe.
@freezed
class UserCreatePasswordRetype with _$UserCreatePasswordRetype {
  const factory UserCreatePasswordRetype({
    /// Adresse e-mail de l'utilisateur
    required String email,

    /// Prénom de l'utilisateur (optionnel)
    String? firstName,

    /// Nom de famille de l'utilisateur (optionnel)
    String? lastName,

    /// ID de l'utilisateur
    required int id,

    /// Mot de passe de l'utilisateur
    required String password,

    /// Confirmation du mot de passe
    required String rePassword,
  }) = _UserCreatePasswordRetype;

  /// Factory pour générer une instance à partir du JSON
  factory UserCreatePasswordRetype.fromJson(Map<String, dynamic> json) =>
      _$UserCreatePasswordRetypeFromJson(json);
}
