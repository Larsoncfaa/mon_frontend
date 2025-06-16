import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../fournisseurs/provider/payment_log_provider.dart';
import '../../fournisseurs/provider/payment_provider.dart';
import '../../models/method_enum.dart';
import '../../models/payment.dart';

class PaiementScreen extends ConsumerStatefulWidget {
  const PaiementScreen({super.key});

  @override
  ConsumerState<PaiementScreen> createState() => _PaiementScreenState();
}

class _PaiementScreenState extends ConsumerState<PaiementScreen> {
  final _formKey = GlobalKey<FormState>();
  MethodEnum? _selectedMethod = MethodEnum.card;
  final _amountController = TextEditingController(text: '49.99');
  final _orderIdController = TextEditingController(text: '1');

  @override
  void dispose() {
    _amountController.dispose();
    _orderIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentNotifierProvider);
    final paymentLogsState = ref.watch(paymentLogNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Paiements')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🧾 Paiement actuel
            paymentState.when(
              data: (payment) => _buildLastPaymentCard(payment),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Erreur paiement : $e'),
            ),
            const SizedBox(height: 24),

            // 🔐 Formulaire de paiement
            _buildPaymentForm(),
            const SizedBox(height: 24),

            // 📜 Historique des paiements
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Historique des paiements",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: _buildPaymentLogs(paymentLogsState)),
          ],
        ),
      ),

      // 🔘 Bouton "Payer maintenant"
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.payment),
        label: const Text("Payer maintenant"),
        onPressed: _submitPayment,
      ),
    );
  }

  Widget _buildLastPaymentCard(Payment? payment) {
    if (payment == null) {
      return const Text("Aucun paiement effectué.");
    }

    return Card(
      elevation: 3,
      child: ListTile(
        title: Text("Commande #${payment.order}"),
        subtitle: Text(
          "Montant : ${payment.amount.toStringAsFixed(2)} FCFA\n"
              "Méthode : ${payment.method.label}",
        ),
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
  }

  Widget _buildPaymentForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _orderIdController,
            decoration: const InputDecoration(labelText: 'Numéro de commande'),
            keyboardType: TextInputType.number,
            validator: (val) => val == null || val.isEmpty ? 'Requis' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: 'Montant'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (val) => val == null || double.tryParse(val) == null
                ? 'Montant invalide'
                : null,
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<MethodEnum>(
            value: _selectedMethod,
            decoration: const InputDecoration(labelText: 'Méthode de paiement'),
            items: MethodEnum.values
                .where((m) => m != MethodEnum.paypal)
                .map(
                  (method) => DropdownMenuItem(
                value: method,
                child: Text(method.label),
              ),
            )
                .toList(),
            onChanged: (value) => setState(() => _selectedMethod = value),
            validator: (val) =>
            val == null ? 'Sélectionnez une méthode' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentLogs(AsyncValue logsState) {
    return logsState.when(
      data: (paginated) {
        final logs = paginated.results;
        if (logs.isEmpty) return const Text("Aucun log enregistré.");

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (_, index) {
                  final log = logs[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.receipt),
                      title: Text("Commande #${log.order}"),
                      subtitle:
                      Text("Montant : ${log.amount.toStringAsFixed(2)} FCFA"),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(log.paymentStatus),
                          Text(
                            DateFormat('dd/MM/yyyy HH:mm')
                                .format(log.attemptTime),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (paginated.next != null)
              ElevatedButton(
                onPressed: () async {
                  try {
                    await ref
                        .read(paymentLogNotifierProvider.notifier)
                        .loadMore();
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erreur : $e")),
                      );
                    }
                  }
                },
                child: const Text("Charger plus"),
              ),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text("Erreur logs : $e"),
    );
  }

  Future<void> _submitPayment() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final orderId = int.tryParse(_orderIdController.text.trim())!;
    final amount = double.tryParse(_amountController.text.trim())!;
    final method = _selectedMethod!;

    final notifier = ref.read(paymentNotifierProvider.notifier);

    await notifier.payerCommande(orderId: orderId, amount: amount, method: method);

    final payment = ref.read(paymentNotifierProvider).maybeWhen(
      data: (p) => p,
      orElse: () => null,
    );

    if (context.mounted && payment != null) {
      Navigator.of(context).pushNamed(
        '/confirmation-paiement',
        arguments: payment,
      );
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Échec du paiement")),
      );
    }
  }
}
