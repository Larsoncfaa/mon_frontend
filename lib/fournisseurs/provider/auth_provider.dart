// ============================
// 📄 auth_provider.dart
// ============================

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/auth_state.dart';
import '../../services/auth_service.dart';
import '../notifications/auth_notifier.dart';
import '../repositories/auth_repository.dart';


final authNotifierProvider =
StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final dio = ref.read(dioProvider); // Utilisation du Dio partagé
  final repository = AuthRepository(AuthService(dio));
  return AuthNotifier(repository);
});