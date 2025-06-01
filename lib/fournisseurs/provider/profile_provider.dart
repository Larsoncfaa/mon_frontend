import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/profile.dart';
import '../../services/profile_service.dart';
import '../notifications/profile_notifier.dart';
import '../repositories/profile_repository.dart';


final profileServiceProvider = Provider<ProfileService>(
      (ref) => ProfileService(ref.watch(dioProvider)),
);

final profileRepositoryProvider = Provider<ProfileRepository>(
      (ref) => ProfileRepository(ref.watch(profileServiceProvider)),
);

final profileNotifierProvider =
AsyncNotifierProvider<ProfileNotifier, Profile>(ProfileNotifier.new);
