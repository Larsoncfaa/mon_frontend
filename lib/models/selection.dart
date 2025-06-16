import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection.freezed.dart';
part 'selection.g.dart';

@freezed
class Selection with _$Selection {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Selection({
    required int id,
    required int product,
    String? image,
    required int quantity,
    required String name,
    @JsonKey(name: 'selling_price') required String sellingPrice,
    String? description,
    @JsonKey(name: 'expiration_date') DateTime? expirationDate,
    required String category,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Selection;

  factory Selection.fromJson(Map<String, dynamic> json) =>
      _$SelectionFromJson(json);
}
