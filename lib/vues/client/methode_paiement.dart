import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../fournisseurs/provider/payment_provider.dart';
import '../../fournisseurs/provider/client_profile_provider.dart'; // 👈 ajoute ceci
import '../../models/order.dart';
import '../../models/method_enum.dart';
import '../../models/payment.dart';
import 'paiement_confirmation_screen.dart';

class PaymentMethodSelectionScreen extends ConsumerWidget {
  final Order order;

  const PaymentMethodSelectionScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientProfile = ref.watch(clientProfileNotifierProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('Choisir une méthode de paiement')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: MethodEnum.values.map((method) {
          return ListTile(
            title: Text(method.label),
            subtitle: method == MethodEnum.balance && clientProfile != null
                ? Text('Solde disponible : ${clientProfile.balance.toStringAsFixed(2)} F')
                : null,
            leading: const Icon(Icons.payment),
            onTap: () async {
              final TextEditingController controller = TextEditingController(
                text: order.total.toStringAsFixed(2),
              );

              await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Montant à payer (${method.label})'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (method == MethodEnum.balance && clientProfile != null)
                        Text(
                          'Solde disponible : ${clientProfile.balance.toStringAsFixed(2)} F',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: controller,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          labelText: 'Montant',
                          hintText: 'Ex: 2000.00',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('Annuler'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final entered = double.tryParse(controller.text);
                        if (entered == null || entered <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Montant invalide')),
                          );
                          return;
                        }

                        Navigator.of(ctx).pop(); // fermer le dialog

                        final notifier = ref.read(paymentNotifierProvider.notifier);
                        final success = await notifier.payerCommande(
                          orderId: order.id!,
                          amount: entered,
                          method: method,
                        );

                        final state = ref.read(paymentNotifierProvider);
                        if (success && state is AsyncData<Payment>) {
                          if (context.mounted) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => PaymentConfirmationScreen(payment: state.value!),
                              ),
                            );
                          }
                        } else {
                          final errorMsg = notifier.lastErrorMessage ?? 'Échec du paiement';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMsg)),
                          );
                        }
                      },
                      child: const Text('Payer'),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
