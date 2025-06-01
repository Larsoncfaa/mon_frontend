import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_profile.freezed.dart';
part 'client_profile.g.dart';

@freezed
class ClientProfile with _$ClientProfile {
  const factory ClientProfile({
    required int id,
    required int user,
    required String location,
    required double balance,
    required int points,
  }) = _ClientProfile;

  factory ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileFromJson(json);
}
