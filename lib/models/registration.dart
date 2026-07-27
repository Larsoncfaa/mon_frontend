import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration.freezed.dart';
part 'registration.g.dart';

@freezed
abstract class Registration with _$Registration {
  const factory Registration({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    required String password,
  }) = _Registration;

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);
}
