import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/vues/client/routes/forms/exchange_form_screen.dart';
import 'package:maliag/vues/client/routes/forms/refund_form_screen.dart';

import '../../../../fournisseurs/provider/refund_request_provider.dart';
import '../../../../fournisseurs/provider/exchange_request_provider.dart';
import '../../widgets/client_drawer_widget.dart';


class MesDemandesScreen extends ConsumerWidget {
  const MesDemandesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refunds = ref.watch(refundRequestNotifierProvider);
    final exchanges = ref.watch(exchangeRequestNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes demandes')),
      drawer: const ClientDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Demandes de remboursement',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.money_off),
              label: const Text('Faire une demande de remboursement'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RefundFormScreen()),
                );
              },
            ),
            refunds.when(
              data: (list) => Column(
                children: list.map((r) => ListTile(
                  title: Text('Remb. #${r.id} – ${r.reason}'),
                  subtitle: Text('Statut: ${r.refundStatus?.name}'),
                )).toList(),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Erreur: $e'),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Demandes d’échange',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.cached),
              label: const Text('Faire une demande d\'échange'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExchangeFormScreen()),
                );
              },
            ),
            exchanges.when(
              data: (data) => Column(
                children: data.results.map((e) => ListTile(
                  title: Text('Échange #${e.id}'),
                  subtitle: Text('Statut: ${e.exchangeStatus?.name ?? "Inconnu"}'),
                )).toList(),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Erreur: $e'),
            ),
          ],
        ),
      ),
    );
  }
}
