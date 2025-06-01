import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_reset_confirm.freezed.dart';
part 'username_reset_confirm.g.dart';

/// Modèle pour la confirmation de changement d'adresse email (username).
@freezed
class UsernameResetConfirm with _$UsernameResetConfirm {
  const factory UsernameResetConfirm({
    /// La nouvelle adresse e-mail à enregistrer pour l'utilisateur
    @JsonKey(name: 'new_email') required String newEmail,
  }) = _UsernameResetConfirm;

  /// Factory pour générer une instance à partir d'un JSON
  factory UsernameResetConfirm.fromJson(Map<String, dynamic> json) =>
      _$UsernameResetConfirmFromJson(json);
}
