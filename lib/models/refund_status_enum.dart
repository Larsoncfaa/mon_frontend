import 'package:freezed_annotation/freezed_annotation.dart';

enum RefundStatusEnum {
  @JsonValue('PENDING')
  pending,

  @JsonValue('APPROVED')
  approved,

  @JsonValue('REJECTED')
  rejected,
}