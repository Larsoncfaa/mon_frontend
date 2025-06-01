import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/profile.dart';
import '../repositories/profile_repository.dart';

class ProfileNotifier extends AsyncNotifier<Profile> {
  late final ProfileRepository _repository;

  ProviderListenable<ProfileRepository>? get profileRepositoryProvider => null;

  @override
  Future<Profile> build() async {
    _repository = ref.watch(profileRepositoryProvider!);
    return _repository.getProfile();
  }

  Future<void> refreshProfile() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repository.getProfile());
  }

  Future<void> updateProfile(Profile profile) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repository.updateProfile(profile));
  }
}
