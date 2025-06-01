import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_obtain_pair.freezed.dart';
part 'token_obtain_pair.g.dart';

/// Représente les données d’authentification échangées via l’API JWT.
/// Généralement utilisé pour envoyer les identifiants et recevoir les tokens.
@freezed
class TokenObtainPair with _$TokenObtainPair {
  const factory TokenObtainPair({
    /// Nom d’utilisateur ou adresse e-mail utilisée pour l’authentification
    required String username,

    /// Mot de passe associé à l’utilisateur
    required String password,

    /// Token JWT d'accès (valide pour les appels API courts)
    required String access,

    /// Token JWT de rafraîchissement (valide plus longtemps, permet de renouveler l'access)
    required String refresh,
  }) = _TokenObtainPair;

  /// Création d’une instance depuis un JSON
  factory TokenObtainPair.fromJson(Map<String, dynamic> json) =>
      _$TokenObtainPairFromJson(json);
}
