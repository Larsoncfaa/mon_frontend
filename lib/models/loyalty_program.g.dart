// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoyaltyProgram _$LoyaltyProgramFromJson(Map<String, dynamic> json) =>
    _LoyaltyProgram(
      id: (json['id'] as num).toInt(),
      client: (json['client'] as num).toInt(),
      points: (json['points'] as num).toInt(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
      transactions: json['transactions'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$LoyaltyProgramToJson(_LoyaltyProgram instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'points': instance.points,
      'last_updated': instance.lastUpdated.toIso8601String(),
      'transactions': instance.transactions,
    };
