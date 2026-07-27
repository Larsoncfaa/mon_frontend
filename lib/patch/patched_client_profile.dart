import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_client_profile.freezed.dart';
part 'patched_client_profile.g.dart';

@freezed
abstract class PatchedClientProfile with _$PatchedClientProfile {
  const factory PatchedClientProfile({
    int? id,
    String? location,
    double? balance,
    @JsonKey(name: 'loyalty_points') int? loyaltyPoints,
    int? user,
  }) = _PatchedClientProfile;

  factory PatchedClientProfile.fromJson(Map<String, dynamic> json) =>
      _$PatchedClientProfileFromJson(json);
}
