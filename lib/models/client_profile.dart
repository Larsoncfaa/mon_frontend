import 'package:freezed_annotation/freezed_annotation.dart';

import 'double_converter.dart'; // ← indispensable ici aussi

part 'client_profile.freezed.dart';
part 'client_profile.g.dart';

@freezed
class ClientProfile with _$ClientProfile {
  const factory ClientProfile({
    required int id,
    required int user,
    String ? location,
    @StringToDoubleConverter() required double balance, // ← ✅ Correction ici
     int ? points,
  }) = _ClientProfile;

  factory ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileFromJson(json);
}
