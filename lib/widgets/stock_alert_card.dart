import 'package:flutter/material.dart';
import 'package:maliag/models/product.dart';
import 'package:maliag/models/stock_alert.dart';

class StockAlertCard extends StatelessWidget {
  final StockAlert alert;

  const StockAlertCard({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    final product = alert.product;

    return Card(
      color: (alert.isActive ?? false) ? Colors.red[100] : Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image ou QR Code
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: product.qrCodeImage != null
                  ? Image.network(
                product.qrCodeImage!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )
                  : const Icon(Icons.qr_code_2, size: 80, color: Colors.grey),
            ),
            const SizedBox(width: 12),

            // Détails
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom du produit
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),

                  // Catégorie
                  Text(
                    'Catégorie : ${product.category ?? "Non définie"}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Description
                  Text(
                    product.description ?? "Aucune description",
                    style: const TextStyle(color: Colors.black87),
                  ),

                  const SizedBox(height: 4),

                  // Stock et prix
                  Text('En stock : ${product.quantityInStock ?? 0} ${product.unit.label}'),
                  Text('Prix de vente : ${product.sellingPrice} FCFA'),

                  const Divider(height: 16),

                  // Alerte
                  Text('🔻 Seuil critique : ${alert.threshold}'),
                  Text('🏬 Entrepôt : ${alert.warehouse?.name ?? "Non défini"}'),

                  Text(
                    alert.isActive == true ? "✅ Statut : Actif" : "⛔ Statut : Inactif",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: alert.isActive == true ? Colors.red[800] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
