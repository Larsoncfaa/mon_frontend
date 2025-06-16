import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/fournisseurs/provider/auth_provider.dart';
import 'package:maliag/models/user_role.dart';

import '../../models/user.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final ProviderSubscription<AsyncValue<User?>> _authSubscription;

  @override
  void initState() {
    super.initState();

    // Écoute des changements de l'état d'authentification
    _authSubscription = ref.listenManual<AsyncValue<User?>>(
      authNotifierProvider,
          (previous, next) {
        next.when(
          data: (user) {
            if (user == null) return;

            debugPrint('✅ Utilisateur connecté : ${user.toJson()}');

            try {
              switch (user.role) {
                case UserRole.agriculteur:
                  Navigator.pushReplacementNamed(context, '/agriculteur');
                  break;
                case UserRole.client:
                  Navigator.pushReplacementNamed(context, '/client');
                  break;
                case UserRole.livreur:
                  Navigator.pushReplacementNamed(context, '/livreur');
                  break;
                }
            } catch (e) {
              debugPrint('❌ Erreur pendant la redirection : $e');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Erreur de redirection')),
              );
            }
          },
          error: (e, _) {
            debugPrint('❌ Erreur authState : $e');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erreur : $e')),
            );
          },
          loading: () {
            debugPrint('⏳ Authentification en cours...');
          },
        );
      },
    );
  }

  Future<void> _login() async {
    final notifier = ref.read(authNotifierProvider.notifier);
    await notifier.login(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: authState.isLoading ? null : _login,
              child: authState.isLoading
                  ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text('Se connecter'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Pas encore de compte ? Inscrivez-vous"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authSubscription.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
