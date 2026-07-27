import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_profile.freezed.dart';
part 'client_profile.g.dart';

@freezed
abstract class ClientProfile with _$ClientProfile {
  const factory ClientProfile({
    required int id,
    required String location,
    required double balance,
    @JsonKey(name: 'loyalty_points') required int loyaltyPoints,
    required int user,
  }) = _ClientProfile;

  factory ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileFromJson(json);
}
