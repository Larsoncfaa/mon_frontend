// lib/screens/agriculteur/stock_management_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/fournisseurs/provider/stock_alert_provider.dart';
import 'package:maliag/fournisseurs/provider/stock_level_provider.dart';
import 'package:maliag/fournisseurs/provider/stock_movement_provider.dart';


import '../../models/stock_movement.dart';


class StockManagementScreen extends ConsumerWidget {
  const StockManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockAlertAsync = ref.watch(stockAlertServiceProvider);
    final stockLevelAsync = ref.watch(stockLevelServiceProvider);
    final stockMovementAsync = ref.watch(stockMovementServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion du stock'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("🔔 Alertes de stock",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            stockAlertAsync.when(
              data: (alerts) => Column(
                children: alerts.map((alert) {
                  return Card(
                    color: alert.isActive ?? false ? Colors.red[100] : Colors.grey[200],
                    child: ListTile(
                      leading: const Icon(Icons.warning, color: Colors.red),
                      title: Text('Produit ID: ${alert.product}'),
                      subtitle: Text('Seuil critique: ${alert.threshold}'),
                    ),
                  );
                }).toList(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Text('Erreur alertes: $err'),
            ),
            const SizedBox(height: 24),

            const Text("📦 Mouvements de stock",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            stockMovementAsync.when(
              data: (movements) => Column(
                children: movements.map((mvt) {
                  return ListTile(
                    leading: Icon(
                      mvt.movementType == MovementTypeEnum.in_
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: mvt.movementType == MovementTypeEnum.in_
                          ? Colors.green
                          : Colors.orange,
                    ),
                    title: Text('Produit ID: ${mvt.product}'),
                    subtitle: Text(
                      '${mvt.movementType.name.toUpperCase()} - ${mvt.quantity} unités\n${mvt.timestamp.toLocal()}',
                    ),
                  );
                }).toList(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Text('Erreur mouvements: $err'),
            ),
            const SizedBox(height: 24),

            const Text("📊 Niveaux de stock",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            stockLevelAsync.when(
              data: (levels) => Column(
                children: levels.map((level) {
                  return Card(
                    child: ListTile(
                      title: Text('Produit ID: ${level.product}'),
                      subtitle: Text('Entrepôt: ${level.warehouse}'),
                      trailing: Text(
                        '${level.quantity}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Text('Erreur niveaux: $err'),
            ),
          ],
        ),
      ),
    );
  }
}
