import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_provider.dart';
import '../../models/client_profile.dart';
import '../../services/client_profile_service.dart';
import '../notifications/client_profile_notifier.dart';
import '../repositories/client_profile_repository.dart';

/// Fournisseur de service pour interagir avec les profils clients.
final clientProfileServiceProvider = Provider<ClientProfileService>((ref) {
  final dio = ref.watch(dioProvider);
  return ClientProfileService(dio);
});

/// Fournisseur de repository pour les profils clients.
final clientProfileRepositoryProvider = Provider<ClientProfileRepository>((ref) {
  final service = ref.watch(clientProfileServiceProvider);
  return ClientProfileRepository(service);
});

/// NotifierProvider pour gérer un profil client via ClientProfileNotifier (Riverpod 3.x).
final clientProfileNotifierProvider =
NotifierProvider<ClientProfileNotifier, AsyncValue<ClientProfile?>>(
  ClientProfileNotifier.new,
);