import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_proof.freezed.dart';
part 'patched_proof.g.dart';

@freezed
class PatchedProof with _$PatchedProof {
  const factory PatchedProof({
    int? id,
    int? delivery,
    String? image,
    @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
  }) = _PatchedProof;

  factory PatchedProof.fromJson(Map<String, dynamic> json) =>
      _$PatchedProofFromJson(json);
}
