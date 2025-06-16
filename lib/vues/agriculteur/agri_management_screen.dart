import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../fournisseurs/provider/exchange_request_provider.dart';
import '../../fournisseurs/provider/invoice_provider.dart';
import '../../fournisseurs/provider/refund_request_provider.dart';
import '../../widgets/app_drawer.dart';

class GestionAgriculteurScreen extends ConsumerWidget {
  const GestionAgriculteurScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3, // TabBar avec 3 onglets
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestion Agricole'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Factures'),
              Tab(text: 'Échanges'),
              Tab(text: 'Remboursements'),
            ],
          ),
        ),
        drawer: const AppDrawer(),
        body: const TabBarView(
          children: [
            _InvoiceTab(),
            _ExchangeTab(),
            _RefundTab(),
          ],
        ),
      ),
    );
  }
}

/// Onglet Factures
class _InvoiceTab extends ConsumerWidget {
  const _InvoiceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceNotifierProvider);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.results.length,
        itemBuilder: (_, index) {
          final invoice = data.results[index];
          return ListTile(
            title: Text('Facture #${invoice.id}'),
            subtitle: Text('Émise le ${invoice.issuedAt.toLocal()}'),
            trailing: const Icon(Icons.picture_as_pdf),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Erreur: $err')),
    );
  }
}

/// Onglet Échanges (avec boutons Accepter / Refuser)
class _ExchangeTab extends ConsumerWidget {
  const _ExchangeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exchangeRequestNotifierProvider);
    final notifier = ref.read(exchangeRequestNotifierProvider.notifier);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.results.length,
        itemBuilder: (_, index) {
          final exchange = data.results[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              title: Text('Échange #${exchange.id}'),
              subtitle: Text('Statut: ${exchange.exchangeStatus}'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) async {
                  if (value == 'accepter') {
                    await notifier.accepter(exchange.id);
                  } else if (value == 'refuser') {
                    await notifier.refuser(exchange.id);
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'accepter', child: Text('Accepter')),
                  PopupMenuItem(value: 'refuser', child: Text('Refuser')),
                ],
              ),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Erreur: $err')),
    );
  }
}

/// Onglet Remboursements (avec boutons Approuver / Rejeter)
class _RefundTab extends ConsumerWidget {
  const _RefundTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(refundRequestNotifierProvider);
    final notifier = ref.read(refundRequestNotifierProvider.notifier);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          final refund = data[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              title: Text('Remb. #${refund.id} – ${refund.reason}'),
              subtitle: Text('Statut: ${refund.refundStatus}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                    tooltip: 'Approuver',
                    onPressed: () {
                      notifier.approuverRemboursement(refund.id);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    tooltip: 'Rejeter',
                    onPressed: () {
                      notifier.rejeterRemboursement(refund.id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Erreur: $err')),
    );
  }
}
