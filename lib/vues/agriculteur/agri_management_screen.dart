import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../fournisseurs/provider/exchange_request_provider.dart';
import '../../fournisseurs/provider/invoice_provider.dart';
import '../../fournisseurs/provider/loyalty_program_provider.dart';
import '../../fournisseurs/provider/promo_code_provider.dart';
import '../../fournisseurs/provider/proof_provider.dart';
import '../../fournisseurs/provider/refund_request_provider.dart';



class GestionAgriculteurScreen extends ConsumerWidget {
  const GestionAgriculteurScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestion Agricole'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Factures'),
              Tab(text: 'Échanges'),
              Tab(text: 'Remboursements'),
              Tab(text: 'Codes Promo'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _InvoiceTab(),
            _ExchangeTab(),
            _RefundTab(),
            _PromoTab(),
          ],
        ),
      ),
    );
  }
}

class _ProofTab extends ConsumerWidget {
  const _ProofTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(proofNotifierProvider);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.results.length,
        itemBuilder: (_, index) {
          final proof = data.results[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              leading: Image.network(proof.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text('Livraison #${proof.delivery}'),
              subtitle: Text('Ajouté le ${proof.uploadedAt.toLocal()}'),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Erreur : $err')),
    );
  }
}

class _LoyaltyProgramTab extends ConsumerWidget {
  const _LoyaltyProgramTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loyaltyProgramNotifierProvider);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.results.length,
        itemBuilder: (_, index) {
          final program = data.results[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: Text('Client #${program.client}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Points : ${program.points}'),
                  Text('Mis à jour : ${program.lastUpdated.toLocal()}'),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Erreur : $err')),
    );
  }
}



class _InvoiceTab extends ConsumerWidget {
  const _InvoiceTab();

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
      error: (err, stack) => Center(child: Text('Erreur: $err')),
    );
  }
}

class _ExchangeTab extends ConsumerWidget {
  const _ExchangeTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exchangeRequestNotifierProvider);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.results.length,
        itemBuilder: (_, index) {
          final exchange = data.results[index];
          return ListTile(
            title: Text('Échange #${exchange.id}'),
            subtitle: Text('Statut: ${exchange.exchangeStatus?.name ?? 'Inconnu'}'),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Erreur: $err')),
    );
  }
}

class _RefundTab extends ConsumerWidget {
  const _RefundTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(refundRequestNotifierProvider);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          final refund = data[index];
          return ListTile(
            title: Text('Remb. #${refund.id} - ${refund.reason}'),
            subtitle: Text('Statut: ${refund.refundStatus.name}'),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Erreur: $err')),
    );
  }
}

class _PromoTab extends ConsumerWidget {
  const _PromoTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(promoCodeNotifierProvider);

    return state.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          final promo = data[index];
          return ListTile(
            title: Text(promo.code),
            subtitle: Text('${promo.discountPercent}% valable du ${promo.validFrom.toLocal()} au ${promo.validTo.toLocal()}'),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Erreur: $err')),
    );
  }
}
