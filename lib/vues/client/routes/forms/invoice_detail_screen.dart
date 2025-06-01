import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/provider/invoice_provider.dart';


class InvoiceDetailScreen extends ConsumerWidget {
  final int invoiceId;
  const InvoiceDetailScreen({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoices = ref.watch(invoiceNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Facture #$invoiceId')),
      body: invoices.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:   (e,_) => Center(child: Text('Erreur : $e')),
        data:    (page) {
          final inv = page.results.firstWhere((i) => i.id == invoiceId);
          return Column(
            children: [
              ListTile(
                title: Text('Commande #${inv.order}'),
                subtitle: Text('Émise le ${inv.issuedAt.toLocal().toString().split('T').first}'),
              ),
              Expanded(
                child: Center(
                  child: Text('PDF à charger depuis: ${inv.pdf}'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
