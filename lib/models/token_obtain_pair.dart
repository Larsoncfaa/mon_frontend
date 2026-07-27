import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_obtain_pair.freezed.dart';
part 'token_obtain_pair.g.dart';

@freezed
abstract class TokenObtainPair with _$TokenObtainPair {
  const factory TokenObtainPair({
    required String email,
    required String password,
    String? access,
    String? refresh,
  }) = _TokenObtainPair;

  factory TokenObtainPair.fromJson(Map<String, dynamic> json) =>
      _$TokenObtainPairFromJson(json);
}
