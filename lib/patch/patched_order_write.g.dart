// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_order_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedOrderWrite _$PatchedOrderWriteFromJson(Map<String, dynamic> json) =>
    _PatchedOrderWrite(
      client: (json['client'] as num?)?.toInt(),
      orderStatus: json['order_status'] as String?,
      lines: json['lines'] as List<dynamic>?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PatchedOrderWriteToJson(_PatchedOrderWrite instance) =>
    <String, dynamic>{
      'client': instance.client,
      'order_status': instance.orderStatus,
      'lines': instance.lines,
      'total': instance.total,
    };
