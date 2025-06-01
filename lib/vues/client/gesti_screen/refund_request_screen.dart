
// 📁 lib/screens/refund_request_screen.dart


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/refund_request_provider.dart';

class RefundRequestScreen extends ConsumerWidget {
  const RefundRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(refundRequestNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Demandes de remboursement')),
      body: state.when(
        loading:  () => const Center(child: CircularProgressIndicator()),
        error:    (e,_) => Center(child: Text('Erreur : $e')),
        data:     (list) {
          if (list.isEmpty) {
            return const Center(child: Text('Aucune demande de remboursement.'));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx,i) {
              final r = list[i];
              return ListTile(
                title:    Text('Remb. #${r.id}'),
                subtitle: Text(r.reason),
                trailing: Text(r.refundStatus.name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/refund/new'),
        child: const Icon(Icons.monetization_on),
      ),
    );
  }
}

