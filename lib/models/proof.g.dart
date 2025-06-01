// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProofImpl _$$ProofImplFromJson(Map<String, dynamic> json) => _$ProofImpl(
      id: (json['id'] as num).toInt(),
      delivery: (json['delivery'] as num).toInt(),
      image: json['image'] as String,
      uploadedAt: DateTime.parse(json['uploaded_at'] as String),
    );

Map<String, dynamic> _$$ProofImplToJson(_$ProofImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'image': instance.image,
      'uploaded_at': instance.uploadedAt.toIso8601String(),
    };
