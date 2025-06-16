import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/notifications/auth_notifier.dart';


class LogoutScreen extends ConsumerWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Déconnexion'),
        automaticallyImplyLeading: false,
      ),
      body: authState.when(
        data: (user) {
          if (user == null) {
            // Si aucun utilisateur n'est connecté
            return const Center(child: Text('Aucun utilisateur connecté.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, size: 60, color: Colors.red.shade400),
                const SizedBox(height: 20),
                Text(
                  'Voulez-vous vous déconnecter ?',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  '${user.username} (${user.email})',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () async {
                    final shouldLogout = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirmer la déconnexion'),
                        content: const Text(
                            'Êtes-vous sûr de vouloir vous déconnecter ?'),
                        actions: [
                          TextButton(
                            child: const Text('Annuler'),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          ElevatedButton(
                            child: const Text('Se déconnecter'),
                            onPressed: () => Navigator.pop(context, true),
                          ),
                        ],
                      ),
                    );

                    if (shouldLogout == true) {
                      await ref.read(authNotifierProvider.notifier).logout();

                      if (context.mounted) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/login', (r) => false);
                      }
                    }
                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text('Se déconnecter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur : $error')),
      ),
    );
  }
}
