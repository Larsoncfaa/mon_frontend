

import '../../models/profile.dart';
import '../../services/profile_service.dart';

class ProfileRepository {
  final ProfileService _service;

  ProfileRepository(this._service);

  Future<Profile> getProfile() {
    return _service.fetchProfile();
  }

  Future<Profile> updateProfile(Profile profile) {
    return _service.updateProfile(profile);
  }
}
