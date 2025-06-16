import 'package:freezed_annotation/freezed_annotation.dart';
import 'selection.dart';

part 'selection_response.freezed.dart';
part 'selection_response.g.dart';

@freezed
class SelectionResponse with _$SelectionResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SelectionResponse({
    required int count,
    String? next,
    String? previous,
    required List<Selection> results,
  }) = _SelectionResponse;

  factory SelectionResponse.fromJson(Map<String, dynamic> json) =>
      _$SelectionResponseFromJson(json);
}
