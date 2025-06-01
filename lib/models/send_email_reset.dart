import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_reset.freezed.dart';
part 'send_email_reset.g.dart';

/// Requête pour envoyer un e-mail de réinitialisation de mot de passe.
@freezed
class SendEmailReset with _$SendEmailReset {
  const factory SendEmailReset({
    /// Adresse e-mail de l'utilisateur pour réinitialiser son mot de passe
    @JsonKey(name: 'email') required String email,
  }) = _SendEmailReset;

  /// Création à partir d’un JSON
  factory SendEmailReset.fromJson(Map<String, dynamic> json) => _$SendEmailResetFromJson(json);
}
