// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedProof _$PatchedProofFromJson(Map<String, dynamic> json) =>
    _PatchedProof(
      id: (json['id'] as num?)?.toInt(),
      delivery: (json['delivery'] as num?)?.toInt(),
      image: json['image'] as String?,
      uploadedAt: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
    );

Map<String, dynamic> _$PatchedProofToJson(_PatchedProof instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'image': instance.image,
      'uploaded_at': instance.uploadedAt?.toIso8601String(),
    };
