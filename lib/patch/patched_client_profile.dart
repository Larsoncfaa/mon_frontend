import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_client_profile.freezed.dart';
part 'patched_client_profile.g.dart';

@freezed
class PatchedClientProfile with _$PatchedClientProfile {
  const factory PatchedClientProfile({
    int? id,
    int? user,
    String? location,
    double? balance,
    int? points,
  }) = _PatchedClientProfile;

  factory PatchedClientProfile.fromJson(Map<String, dynamic> json) =>
      _$PatchedClientProfileFromJson(json);
}
