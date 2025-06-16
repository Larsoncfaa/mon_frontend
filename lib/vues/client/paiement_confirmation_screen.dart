import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/payment.dart';
import '../../models/method_enum.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final Payment payment;

  const PaymentConfirmationScreen({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    final formattedDate = payment.paidAt != null
        ? DateFormat('dd/MM/yyyy HH:mm').format(payment.paidAt!)
        : 'Non spécifiée';

    return Scaffold(
      appBar: AppBar(title: const Text('Commande confirmée')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.check_circle, color: Colors.green, size: 80),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Paiement effectué avec succès 🎉",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            _infoLine("Commande n°", "${payment.order}"),
            _infoLine("Montant", "${payment.amount.toStringAsFixed(2)} FCFA"),
            _infoLine("Méthode de paiement", payment.method.label),
            _infoLine("Date de paiement", formattedDate),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home),
                  label: const Text("Accueil"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/mes-commandes');
                  },
                  icon: const Icon(Icons.receipt_long),
                  label: const Text("Mes commandes"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoLine(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text("$title ",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
