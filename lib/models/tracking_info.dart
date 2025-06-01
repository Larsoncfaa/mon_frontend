import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_info.freezed.dart';
part 'tracking_info.g.dart';

/// Informations de suivi d'une livraison
@freezed
class TrackingInfo with _$TrackingInfo {
  const factory TrackingInfo({
    required int id,

    /// ID de la livraison associée
    required int delivery,

    /// Statut actuel du suivi (ex: "en cours", "livré", etc.)
    required String trackingStatus,

    /// Localisation actuelle ou signalement du colis
    required String location,

    /// Date et heure du suivi
    required DateTime timestamp,
  }) = _TrackingInfo;

  /// Méthode de désérialisation à partir du JSON
  factory TrackingInfo.fromJson(Map<String, dynamic> json) => _$TrackingInfoFromJson(json);
}
