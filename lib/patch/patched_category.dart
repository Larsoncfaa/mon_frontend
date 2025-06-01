// patched_category.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_category.freezed.dart';
part 'patched_category.g.dart';

@freezed
class PatchedCategory with _$PatchedCategory {
  const factory PatchedCategory({
    int? id,
    String? name,
  }) = _PatchedCategory;

  factory PatchedCategory.fromJson(Map<String, dynamic> json) => _$PatchedCategoryFromJson(json);
}