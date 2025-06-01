import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/client_profile.dart';


part 'paginated_client_profile.freezed.dart';
part 'paginated_client_profile.g.dart'; // ← Obligatoire pour la (de)serialization




@freezed
class PaginatedClientProfile with _$PaginatedClientProfile {
  const factory PaginatedClientProfile({
    required int count,
    String? next,
    String? previous,
    required List<ClientProfile> results,
  }) = _PaginatedClientProfile;

  factory PaginatedClientProfile.fromJson(Map<String, dynamic> json) =>
      _$PaginatedClientProfileFromJson(json);
}
