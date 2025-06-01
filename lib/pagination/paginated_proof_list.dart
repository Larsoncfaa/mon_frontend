import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/proof.dart';


part 'paginated_proof_list.freezed.dart';
part 'paginated_proof_list.g.dart';

@freezed
class PaginatedProofList with _$PaginatedProofList {
  const factory PaginatedProofList({
    required int count,
    String? next,
    String? previous,
    required List<Proof> results,
  }) = _PaginatedProofList;

  factory PaginatedProofList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProofListFromJson(json);
}
