import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/registration.dart';


part 'paginated_registration_list.freezed.dart';
part 'paginated_registration_list.g.dart';

@freezed
class PaginatedRegistrationList with _$PaginatedRegistrationList {
  const factory PaginatedRegistrationList({
    required int count,
    String? next,
    String? previous,
    required List<Registration> results,
  }) = _PaginatedRegistrationList;

  factory PaginatedRegistrationList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedRegistrationListFromJson(json);
}
