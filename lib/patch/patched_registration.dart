import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_registration.freezed.dart';
part 'patched_registration.g.dart';

@freezed
abstract class PatchedRegistration with _$PatchedRegistration {
  const factory PatchedRegistration({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? password,
  }) = _PatchedRegistration;

  factory PatchedRegistration.fromJson(Map<String, dynamic> json) =>
      _$PatchedRegistrationFromJson(json);
}
