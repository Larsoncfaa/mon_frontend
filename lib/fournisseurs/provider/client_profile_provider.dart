// lib/features/client_profile/providers/client_profile_service_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_provider.dart';
import '../../services/client_profile_service.dart';


/// Fournisseur de service pour interagir avec les profils clients.
final clientProfileServiceProvider = Provider<ClientProfileService>((ref) {
  final dio = ref.watch(dioProvider); // Tu récupères Dio ici
  return ClientProfileService(dio);   // Et tu l'injectes ici
});
