import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/auth_provider.dart';
import '../../models/user.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final success = await ref
        .read(authNotifierProvider.notifier)
        .login(email: email, password: password);

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Échec de la connexion')),
      );
      return;
    }

    // Après un login réussi, navigue selon le rôle
    final state = ref.read(authNotifierProvider);
    state.when(
      initial: () {
        // impossible ici, on est en data
      },
      loading: () {
        // pas nécessaire
      },
      error: (_) {
        // déjà géré plus haut
      },
      data: (user) {
        if (user == null) return;
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
          case null:
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: authState.when(
          initial: () => _buildLoginForm(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Erreur : $msg",
                  style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
              _buildLoginForm(),
            ],
          ),
          data: (_) => _buildLoginForm(),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Mot de passe'),
            obscureText: true,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text("Pas encore de compte ? Créez-en un"),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _login,
            child: const Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}
