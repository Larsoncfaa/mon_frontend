import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/utilisateur.dart';
import '../repositories/auth_repository.dart';

final authProvider = StateNotifierProvider<AuthNotifier, Utilisateur?>(
      (ref) => AuthNotifier(ref.watch(authRepositoryProvider)),
);

class AuthNotifier extends StateNotifier<Utilisateur?> {
  final AuthRepository _repo;
  AuthNotifier(this._repo) : super(null);

  Future<void> login(String email, String mdp) async {
    final user = await _repo.login(email, mdp);
    state = user;
  }

  Future<void> logout() async {
    await _repo.logout();
    state = null;
  }
}
