import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_refresh.freezed.dart';
part 'token_refresh.g.dart';

/// Représente la réponse d’un appel de rafraîchissement de token JWT.
/// Généralement retournée par un endpoint comme `/api/token/refresh/`.
@freezed
class TokenRefresh with _$TokenRefresh {
  const factory TokenRefresh({
    /// Nouveau token d’accès (JWT) généré par le backend
    required String access,

    /// Token de rafraîchissement (souvent inchangé, mais parfois renouvelé)
    required String refresh,
  }) = _TokenRefresh;

  /// Instancie un `TokenRefresh` à partir d’un JSON (réponse d’API).
  factory TokenRefresh.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshFromJson(json);
}
