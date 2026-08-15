import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/profile.dart';
import '../../services/profile_service.dart';
import '../repositories/profile_repository.dart';

/// 1. Service Provider
final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(profileServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class ProfileNotifier extends AsyncNotifier<Profile> {
  @override
  Future<Profile> build() async {
    final repository = ref.watch(profileRepositoryProvider);
    return repository.getProfile();
  }

  /// Rafraîchit le profil
  Future<void> refreshProfile() async {
    final repository = ref.read(profileRepositoryProvider);
    state = const AsyncLoading<Profile>();
    state = await AsyncValue.guard(() => repository.getProfile());
  }

  /// Met à jour le profil
  Future<void> updateProfile(Profile profile) async {
    final repository = ref.read(profileRepositoryProvider);
    state = const AsyncLoading<Profile>();
    state = await AsyncValue.guard(() => repository.updateProfile(profile));
  }
}

/// 3. Notifier Provider principal
final profileNotifierProvider =
AsyncNotifierProvider<ProfileNotifier, Profile>(
  ProfileNotifier.new,
);
