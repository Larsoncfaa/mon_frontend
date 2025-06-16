import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/order.dart';

class OrdersListScreen extends StatelessWidget {
  final List<Order> orders;

  const OrdersListScreen({Key? key, required this.orders}) : super(key: key);

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes commandes')),
      body: orders.isEmpty
          ? const Center(child: Text('Aucune commande trouvée'))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.receipt_long),
              title: Text('Commande #${order.id}'),
              subtitle: Text('Date : ${_formatDate(order.dateOrdered)}'),
              trailing: Text(
                '${order.total.toStringAsFixed(2)} FCFA',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // 🔜 Naviguer vers un écran de détails
                // Navigator.pushNamed(context, '/order-detail', arguments: order);
              },
            ),
          );
        },
      ),
    );
  }
}
