import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/loyalty_program.dart';


part 'paginated_loyalty_program_list.freezed.dart';
part 'paginated_loyalty_program_list.g.dart';

@freezed
class PaginatedLoyaltyProgramList with _$PaginatedLoyaltyProgramList {
  const factory PaginatedLoyaltyProgramList({
    required int count,
    String? next,
    String? previous,
    required List<LoyaltyProgram> results,
  }) = _PaginatedLoyaltyProgramList;

  factory PaginatedLoyaltyProgramList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedLoyaltyProgramListFromJson(json);
}
