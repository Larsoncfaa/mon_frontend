import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../fournisseurs/provider/payment_log_provider.dart';
import '../../fournisseurs/provider/payment_provider.dart';
import '../../models/method_enum.dart';



class PaiementScreen extends ConsumerWidget {
  const PaiementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(paymentNotifierProvider);
    final paymentLogsState = ref.watch(paymentLogNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Paiements')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// 🔷 Dernier Paiement
            paymentState.when(
              data: (payment) {
                if (payment == null) {
                  return const Text("Aucun paiement effectué.");
                }
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text("Commande #${payment.order}"),
                    subtitle: Text("Montant : ${payment.amount.toStringAsFixed(2)} €\n"
                        "Méthode : ${payment.method.name}"),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          payment.paymentStatus?.name ?? "Inconnu",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (payment.paidAt != null)
                          Text(
                            DateFormat('dd/MM/yyyy HH:mm').format(payment.paidAt!),
                            style: const TextStyle(fontSize: 12),
                          ),
                      ],
                    ),
                  ),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Erreur paiement : $e'),
            ),

            const SizedBox(height: 24),

            /// 📜 Logs de paiement
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Historique des paiements",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: paymentLogsState.when(
                data: (paginated) {
                  final logs = paginated.results;
                  return Column(
                    children: [
                      if (logs.isEmpty)
                        const Text("Aucun log enregistré."),
                      if (logs.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            itemCount: logs.length,
                            itemBuilder: (context, index) {
                              final log = logs[index];
                              return Card(
                                child: ListTile(
                                  leading: const Icon(Icons.receipt),
                                  title: Text("Commande #${log.order}"),
                                  subtitle: Text("Montant : ${log.amount.toStringAsFixed(2)} €"),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(log.paymentStatus),
                                      Text(
                                        DateFormat('dd/MM/yyyy HH:mm').format(log.attemptTime),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                      /// Pagination bouton "Charger plus"
                      if (paginated.next != null)
                        ElevatedButton(
                          onPressed: () async {
                            await ref
                                .read(paymentLogNotifierProvider.notifier)
                                .loadMore();
                          },
                          child: const Text("Charger plus"),
                        ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Erreur logs : $e'),
              ),
            ),
          ],
        ),
      ),

      /// 🔘 Bouton Flottant : Créer un paiement
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // À adapter selon ta logique métier ou backend
          final notifier = ref.read(paymentNotifierProvider.notifier);
          final success = await notifier.payerCommande(
            orderId: 1, // <-- tu peux le passer dynamiquement
            amount: 49.99,
            method: MethodEnum.creditCard, // ou autre
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(success ? "Paiement effectué" : "Échec du paiement"),
              ),
            );
          }
        },
        icon: const Icon(Icons.payment),
        label: const Text("Payer maintenant"),
      ),
    );
  }
}
