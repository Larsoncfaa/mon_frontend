// 📁 lib/screens/loyalty_screen.dart


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/loyalty_program_provider.dart';

class LoyaltyScreen extends ConsumerWidget {
  const LoyaltyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loyaltyProgramNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Programme de fidélité')),
      body: state.when(
        loading:  () => const Center(child: CircularProgressIndicator()),
        error:    (e,_) => Center(child: Text('Erreur : $e')),
        data:     (page) {
          if (page.results.isEmpty) {
            return const Center(child: Text('Aucun programme de fidélité.'));
          }
          final prog = page.results.first;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Points : ${prog.points}', style: const TextStyle(fontSize: 24)),
                Text('Mise à jour : ${prog.lastUpdated.toLocal().toString().split('T').first}'),
                const SizedBox(height: 16),
                const Text('Historique des transactions', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: prog.transactions?.entries.map((e) {
                      return ListTile(
                        title: Text(e.key),
                        trailing: Text(e.value.toString()),
                      );
                    }).toList() ?? [],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
