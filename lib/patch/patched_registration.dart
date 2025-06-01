import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_registration.freezed.dart';
part 'patched_registration.g.dart';

/// Variante partielle du modèle Registration pour les mises à jour (PATCH).
/// Tous les champs sont optionnels pour permettre une mise à jour partielle.
@freezed
class PatchedRegistration with _$PatchedRegistration {
  const factory PatchedRegistration({
    /// Prénom (optionnel)
    @JsonKey(name: 'first_name') String? firstName,

    /// Nom (optionnel)
    @JsonKey(name: 'last_name') String? lastName,

    /// Email (optionnel)
    String? email,

    /// Mot de passe (optionnel)
    String? password,
  }) = _PatchedRegistration;

  /// Méthode pour générer une instance à partir d'un JSON
  factory PatchedRegistration.fromJson(Map<String, dynamic> json) =>
      _$PatchedRegistrationFromJson(json);
}
