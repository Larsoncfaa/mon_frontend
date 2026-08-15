import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../fournisseurs/provider/auth_provider.dart';
import '../../models/user.dart';
import '../../models/user_role.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  UserRole? _selectedRole;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRole == null) {
      _showError('Veuillez sélectionner votre rôle.');
      return;
    }
    if (!_acceptTerms) {
      _showError('Veuillez accepter les conditions d’utilisation.');
      return;
    }

    final success = await ref.read(authNotifierProvider.notifier).register(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim().toLowerCase(),
      password: _passwordController.text,
      role: _selectedRole!,
      phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
      location: _locationController.text.trim().isEmpty ? null : _locationController.text.trim(),
    );

    if (!mounted) return;
    if (!success) {
      final authState = ref.read(authNotifierProvider);
      authState.whenOrNull(error: (error, _) => _showError(error.toString()));
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen<AsyncValue<User?>>(authNotifierProvider, (prev, next) {
      next.whenData((user) {
        if (user != null) {
          final route = switch (user.role) {
            UserRole.agriculteur => '/agriculteur',
            UserRole.client => '/client',
            UserRole.livreur => '/livreur',
          };
          Navigator.pushReplacementNamed(context, route);
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: authState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            const Gap(32),
            const Text('Créer un compte', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            const Gap(8),
            Text('Rejoignez la communauté Maliag dès aujourd\'hui.', style: TextStyle(color: Colors.grey.shade500)),
            const Gap(32),
            
            _SectionHeader(title: 'Identité', icon: Iconsax.user),
            const Gap(16),
            Row(
              children: [
                Expanded(child: _buildField(_firstNameController, 'Prénom', Iconsax.user)),
                const Gap(12),
                Expanded(child: _buildField(_lastNameController, 'Nom', Iconsax.user)),
              ],
            ),
            const Gap(24),

            _SectionHeader(title: 'Contact', icon: Iconsax.call),
            const Gap(16),
            _buildField(_emailController, 'Email', Iconsax.sms, keyboard: TextInputType.emailAddress),
            const Gap(12),
            _buildField(_phoneController, 'Téléphone', Iconsax.mobile, prefix: '+223 '),
            const Gap(12),
            _buildField(_locationController, 'Localisation', Iconsax.location),
            const Gap(32),

            _SectionHeader(title: 'Votre Rôle', icon: Iconsax.category),
            const Gap(16),
            _buildRoleSelector(),
            const Gap(32),

            _SectionHeader(title: 'Sécurité', icon: Iconsax.lock),
            const Gap(16),
            _buildPasswordField(),
            const Gap(12),
            _buildConfirmField(),
            const Gap(32),

            _buildTerms(),
            const Gap(24),
            _buildSubmitButton(),
            const Gap(16),
            _buildLoginLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Iconsax.arrow_left_2),
          style: IconButton.styleFrom(backgroundColor: Colors.grey.shade50, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        Image.network('https://cdn-icons-png.flaticon.com/512/2910/2910756.png', height: 40), // Placeholder logo
      ],
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, {TextInputType? keyboard, String? prefix}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
        prefixIcon: Icon(icon, size: 20),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildRoleSelector() {
    return Row(
      children: [
        _RoleButton(role: UserRole.client, icon: Iconsax.shopping_bag, selected: _selectedRole == UserRole.client, onTap: () => setState(() => _selectedRole = UserRole.client)),
        const Gap(12),
        _RoleButton(role: UserRole.agriculteur, icon: Iconsax.status_up, selected: _selectedRole == UserRole.agriculteur, onTap: () => setState(() => _selectedRole = UserRole.agriculteur)),
        const Gap(12),
        _RoleButton(role: UserRole.livreur, icon: Iconsax.truck_fast, selected: _selectedRole == UserRole.livreur, onTap: () => setState(() => _selectedRole = UserRole.livreur)),
      ],
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        prefixIcon: const Icon(Iconsax.lock, size: 20),
        suffixIcon: IconButton(icon: Icon(_obscurePassword ? Iconsax.eye : Iconsax.eye_slash), onPressed: () => setState(() => _obscurePassword = !_obscurePassword)),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildConfirmField() {
    return TextFormField(
      controller: _confirmController,
      obscureText: _obscureConfirmPassword,
      decoration: InputDecoration(
        labelText: 'Confirmer',
        prefixIcon: const Icon(Iconsax.lock_1, size: 20),
        suffixIcon: IconButton(icon: Icon(_obscureConfirmPassword ? Iconsax.eye : Iconsax.eye_slash), onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword)),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildTerms() {
    return Row(
      children: [
        Checkbox(value: _acceptTerms, activeColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), onChanged: (v) => setState(() => _acceptTerms = v ?? false)),
        const Expanded(child: Text('J\'accepte les conditions d\'utilisation', style: TextStyle(fontSize: 13))),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _register,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 0),
        child: const Text('S\'inscrire', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
        child: Text.rich(TextSpan(text: 'Déjà un compte ? ', style: TextStyle(color: Colors.grey.shade600), children: const [TextSpan(text: 'Se connecter', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))])),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionHeader({required this.title, required this.icon});
  @override
  Widget build(BuildContext context) => Row(children: [Icon(icon, size: 18, color: Colors.green), const Gap(8), Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))]);
}

class _RoleButton extends StatelessWidget {
  final UserRole role;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _RoleButton({required this.role, required this.icon, required this.selected, required this.onTap});
  @override
  Widget build(BuildContext context) => Expanded(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: selected ? Colors.green.withValues(alpha: 0.1) : Colors.grey.shade50, borderRadius: BorderRadius.circular(16), border: Border.all(color: selected ? Colors.green : Colors.transparent, width: 2)),
        child: Column(children: [Icon(icon, color: selected ? Colors.green : Colors.grey), const Gap(8), Text(role.name.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: selected ? Colors.green : Colors.grey))]),
      ),
    ),
  );
}
