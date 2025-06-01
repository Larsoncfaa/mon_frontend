import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_program.freezed.dart';
part 'loyalty_program.g.dart';

@freezed
class LoyaltyProgram with _$LoyaltyProgram {
  const factory LoyaltyProgram({
    required int id,
    required int client,
    required int points,
    required DateTime lastUpdated,
    Map<String, dynamic>? transactions, // JsonObject → Map<String, dynamic>
  }) = _LoyaltyProgram;

  factory LoyaltyProgram.fromJson(Map<String, dynamic> json) => _$LoyaltyProgramFromJson(json);
}
