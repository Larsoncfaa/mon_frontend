// 📁 lib/screens/invoice_screen.dart


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/invoice_provider.dart';

class InvoiceScreen extends ConsumerWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Factures')),
      body: state.when(
        loading:  () => const Center(child: CircularProgressIndicator()),
        error:    (e,_) => Center(child: Text('Erreur : $e')),
        data:     (page) {
          final inv = page.results;
          if (inv.isEmpty) {
            return const Center(child: Text('Aucune facture disponible.'));
          }
          return ListView.builder(
            itemCount: inv.length,
            itemBuilder: (ctx,i) {
              final f = inv[i];
              return ListTile(
                title:    Text('Facture #${f.id}'),
                subtitle: Text('Émise le ${f.issuedAt.toLocal().toString().split('T').first}'),
                trailing: IconButton(
                  icon: const Icon(Icons.picture_as_pdf),
                  onPressed: () => Navigator.pushNamed(context, '/invoices/${f.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

