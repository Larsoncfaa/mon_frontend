import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_verify.freezed.dart';
part 'token_verify.g.dart';

@freezed
abstract class TokenVerify with _$TokenVerify {
  const factory TokenVerify({
    required String token,
  }) = _TokenVerify;

  factory TokenVerify.fromJson(Map<String, dynamic> json) =>
      _$TokenVerifyFromJson(json);
}
