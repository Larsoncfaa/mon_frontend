
// 📁 lib/screens/return_request_screen.dart


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/exchange_request_provider.dart';

class ReturnRequestScreen extends ConsumerWidget {
  const ReturnRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exchangeRequestNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Demandes d’échange')),
      body: state.when(
        loading:  () => const Center(child: CircularProgressIndicator()),
        error:    (e,_) => Center(child: Text('Erreur : $e')),
        data:     (page) {
          final list = page.results;
          if (list.isEmpty) {
            return const Center(child: Text('Aucune demande d’échange.'));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx,i) {
              final ex = list[i];
              return ListTile(
                title:    Text('Échange #${ex.id}'),
                subtitle: Text('Statut : ${ex.exchangeStatus?.name ?? ''}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/exchange/new'),
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}
