import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_refresh.freezed.dart';
part 'token_refresh.g.dart';

@freezed
abstract class TokenRefresh with _$TokenRefresh {
  const factory TokenRefresh({
    required String refresh,
    String? access,
  }) = _TokenRefresh;

  factory TokenRefresh.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshFromJson(json);
}
