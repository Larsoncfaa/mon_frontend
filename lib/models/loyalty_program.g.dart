// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoyaltyProgramImpl _$$LoyaltyProgramImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyProgramImpl(
      id: (json['id'] as num).toInt(),
      client: (json['client'] as num).toInt(),
      points: (json['points'] as num).toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      transactions: json['transactions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$LoyaltyProgramImplToJson(
        _$LoyaltyProgramImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'points': instance.points,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'transactions': instance.transactions,
    };
