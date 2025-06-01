import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

/// Représente un profil utilisateur, généralement retourné après authentification.
@freezed
class Profile with _$Profile {
  const factory Profile({
    required int id,

    /// Nom d'utilisateur (150 caractères max)
    required String username,

    /// Adresse e-mail
    required String email,

    /// Prénom (optionnel)
    String? firstName,

    /// Nom (optionnel)
    String? lastName,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
