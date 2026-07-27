import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_program.freezed.dart';
part 'loyalty_program.g.dart';

@freezed
abstract class LoyaltyProgram with _$LoyaltyProgram {
  const factory LoyaltyProgram({
    required int id,
    required int client,
    required int points,
    @JsonKey(name: 'last_updated') required DateTime lastUpdated,
    @Default({}) Map<String, dynamic> transactions,
  }) = _LoyaltyProgram;

  factory LoyaltyProgram.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyProgramFromJson(json);
}
