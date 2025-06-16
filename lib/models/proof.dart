import 'package:freezed_annotation/freezed_annotation.dart';

part 'proof.freezed.dart';
part 'proof.g.dart';

@freezed
class Proof with _$Proof {
  const factory Proof({
    required int id,
    required int delivery,
    required String image,
    required DateTime uploadedAt,
  }) = _Proof;

  factory Proof.fromJson(Map<String, dynamic> json) => _$ProofFromJson(json);
}
