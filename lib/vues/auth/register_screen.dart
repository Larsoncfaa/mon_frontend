import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../fournisseurs/provider/auth_provider.dart';
import '../../models/user.dart';
import '../../models/user_role.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  UserRole? _selectedRole;

  late final ProviderSubscription<AsyncValue<User?>> _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription = ref.listenManual<AsyncValue<User?>>(
      authNotifierProvider,
          (previous, next) {
        next.when(
          data: (user) {
            if (user == null) return;
            _redirectByRole(user.role);
          },
          error: (err, _) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erreur : ${err.toString()}')),
            );
          },
          loading: () {
            debugPrint('Authentification en cours...');
          },
        );
      },
    );
  }
  @override
  void dispose() {
    _authSubscription.close();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  /// Redirige selon le rôle de l'utilisateur
  void _redirectByRole(UserRole role) {
    final route = switch (role) {
      UserRole.agriculteur => '/agriculteur',
      UserRole.client => '/client',
      UserRole.livreur => '/livreur',
    };
    Navigator.pushReplacementNamed(context, route);
  }

  /// Fonction d'inscription avec validation des champs
  Future<void> _register() async {
    FocusScope.of(context).unfocus(); // Ferme le clavier

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirm = _confirmController.text;

    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || confirm.isEmpty) {
      _showError("Veuillez remplir tous les champs");
      return;
    }

    if (password != confirm) {
      _showError("Les mots de passe ne correspondent pas");
      return;
    }

    if (_selectedRole == null) {
      _showError("Veuillez choisir un rôle");
      return;
    }

    await ref.read(authNotifierProvider.notifier).register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      role: _selectedRole!,
    );
  }

  /// Affiche un snackbar d'erreur
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: SafeArea(
        child: authState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _buildForm(),
      ),
    );
  }

  /// Construit le formulaire d'inscription
  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _firstNameController,
            decoration: const InputDecoration(labelText: 'Prénom'),
            textInputAction: TextInputAction.next,
            autofocus: true,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _lastNameController,
            decoration: const InputDecoration(labelText: 'Nom'),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Mot de passe'),
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _confirmController,
            decoration: const InputDecoration(labelText: 'Confirmer le mot de passe'),
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<UserRole>(
            value: _selectedRole,
            onChanged: (value) => setState(() => _selectedRole = value),
            items: UserRole.values.map((role) {
              return DropdownMenuItem(
                value: role,
                child: Text(_localizedRole(role)),
              );
            }).toList(),
            decoration: const InputDecoration(labelText: 'Choisissez un rôle'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _register,
            child: const Text("S'inscrire"),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: const Text("Déjà un compte ? Se connecter"),
          ),
        ],
      ),
    );
  }

  /// Retourne le libellé français du rôle
  String _localizedRole(UserRole role) {
    switch (role) {
      case UserRole.agriculteur:
        return 'Agriculteur';
      case UserRole.client:
        return 'Client';
      case UserRole.livreur:
        return 'Livreur';
    }
  }
}
