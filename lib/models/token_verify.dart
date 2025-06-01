import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_verify.freezed.dart';
part 'token_verify.g.dart';

/// Modèle utilisé pour vérifier un JWT auprès du backend.
/// Typiquement envoyé à un endpoint comme `/api/token/verify/`.
@freezed
class TokenVerify with _$TokenVerify {
  /// Le constructeur classique, utilisé pour instancier la classe.
  const factory TokenVerify({
    /// Le token JWT que tu veux vérifier (valide ou expiré ?).
    required String token,
  }) = _TokenVerify;

  /// Permet de créer une instance depuis un JSON (ex: lors de la désérialisation d’une requête).
  factory TokenVerify.fromJson(Map<String, dynamic> json) =>
      _$TokenVerifyFromJson(json);
}
