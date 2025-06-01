// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedProofImpl _$$PatchedProofImplFromJson(Map<String, dynamic> json) =>
    _$PatchedProofImpl(
      id: (json['id'] as num?)?.toInt(),
      delivery: (json['delivery'] as num?)?.toInt(),
      image: json['image'] as String?,
      uploadedAt: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
    );

Map<String, dynamic> _$$PatchedProofImplToJson(_$PatchedProofImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'image': instance.image,
      'uploaded_at': instance.uploadedAt?.toIso8601String(),
    };
