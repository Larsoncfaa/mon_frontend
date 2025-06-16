import 'package:flutter/material.dart';
import '../../models/order.dart';
import '../../models/order_line.dart';
import 'methode_paiement.dart';
// Assure-toi que ce fichier est bien importé

class OrderConfirmationScreen extends StatelessWidget {
  final Order order;

  const OrderConfirmationScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation de la commande'),
        automaticallyImplyLeading: false, // Empêche le back automatique
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Commande #${order.id}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Date : ${order.dateOrdered.toLocal().toString().split(" ")[0]}'),
            const SizedBox(height: 8),
            Text(
              'Total : ${order.total.toStringAsFixed(2)} FCFA',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: order.lines.length,
                itemBuilder: (context, index) {
                  final OrderLine line = order.lines[index];
                  return ListTile(
                    title: Text(line.product.name),
                    subtitle: Text('Quantité : ${line.quantity}'),
                    trailing: Text('${(line.unitPrice ?? 0).toStringAsFixed(2)} FCFA'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PaymentMethodSelectionScreen(order: order),
                  ),
                );
              },
              child: const Text('Payer maintenant'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  '/orders-list',
                  arguments: [order], // liste contenant la commande actuelle
                );
              },
              child: const Text('Voir mes commandes'),
            ),
          ],
        ),
      ),
    );
  }
}
