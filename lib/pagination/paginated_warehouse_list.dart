import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/warehouse.dart';


part 'paginated_warehouse_list.freezed.dart';
part 'paginated_warehouse_list.g.dart';

@freezed
class PaginatedWarehouseList with _$PaginatedWarehouseList {
  const factory PaginatedWarehouseList({
    required int count,
    String? next,
    String? previous,
    required List<Warehouse> results,
  }) = _PaginatedWarehouseList;

  factory PaginatedWarehouseList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedWarehouseListFromJson(json);
}
