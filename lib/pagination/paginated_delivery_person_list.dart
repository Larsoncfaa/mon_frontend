import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/delivery_person.dart';

part 'paginated_delivery_person_list.freezed.dart';
part 'paginated_delivery_person_list.g.dart';

@freezed
class PaginatedDeliveryPersonList with _$PaginatedDeliveryPersonList {
  const factory PaginatedDeliveryPersonList({
    required int count,
    String? next,
    String? previous,
    required List<DeliveryPerson> results,
  }) = _PaginatedDeliveryPersonList;

  factory PaginatedDeliveryPersonList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDeliveryPersonListFromJson(json);
}
