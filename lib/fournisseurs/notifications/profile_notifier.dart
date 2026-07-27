import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/profile.dart';
import '../repositories/profile_repository.dart';

// Provider du repository (à adapter selon ton projet)
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  throw UnimplementedError('Initialisez votre ProfileRepository ici');
});

/// AsyncNotifier moderne pour Riverpod 3.x
class ProfileNotifier extends AsyncNotifier<Profile> {
  late final ProfileRepository _repository;

  @override
  Future<Profile> build() async {
    _repository = ref.watch(profileRepositoryProvider);
    return _repository.getProfile();
  }

  /// Rafraîchit le profil sans perdre l'état précédent pendant le chargement
  Future<void> refreshProfile() async {
    state = const AsyncLoading<Profile>().copyWithPrevious(state);
    state = await AsyncValue.guard(() => _repository.getProfile());
  }

  /// Met à jour le profil
  Future<void> updateProfile(Profile profile) async {
    state = const AsyncLoading<Profile>().copyWithPrevious(state);
    state = await AsyncValue.guard(() => _repository.updateProfile(profile));
  }
}

/// Provider pour Riverpod 3.x
final profileNotifierProvider =
AsyncNotifierProvider<ProfileNotifier, Profile>(
  ProfileNotifier.new,
);