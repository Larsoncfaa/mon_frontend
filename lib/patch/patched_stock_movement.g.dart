// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_stock_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedStockMovementImpl _$$PatchedStockMovementImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedStockMovementImpl(
      productId: json['productId'] as String?,
      movementType: json['movementType'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      source: json['source'] as String?,
      destination: json['destination'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$PatchedStockMovementImplToJson(
        _$PatchedStockMovementImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'movementType': instance.movementType,
      'quantity': instance.quantity,
      'source': instance.source,
      'destination': instance.destination,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
