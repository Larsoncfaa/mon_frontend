import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/category.dart';

part 'paginated_category.freezed.dart';
part 'paginated_category.g.dart';

@freezed
abstract class PaginatedCategory with _$PaginatedCategory {
  const factory PaginatedCategory({
    required int count,
    String? next,
    String? previous,
    required List<Category> results,
  }) = _PaginatedCategory;

  factory PaginatedCategory.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCategoryFromJson(json);
}
