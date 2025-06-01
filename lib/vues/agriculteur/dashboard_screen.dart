// 📦 FICHIER : lib/screens/agriculteur/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../fournisseurs/provider/delivery_predict_provider.dart';
import '../../fournisseurs/provider/inventory_predict_provider.dart';
import '../../fournisseurs/provider/order_provider.dart';
import '../../fournisseurs/provider/sales_predict_provider.dart';
import '../../fournisseurs/provider/stock_alert_provider.dart';
import '../../fournisseurs/provider/stock_level_provider.dart';


import '../../widgets/loading_widget.dart';

class DashboardAgriculteurScreen extends ConsumerWidget {
  const DashboardAgriculteurScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Utilisation des notifiers existants
    final alertsAsync    = ref.watch(stockAlertNotifierProvider);
    final levelsAsync    = ref.watch(stockLevelNotifierProvider);
    final ordersAsync    = ref.watch(orderNotifierProvider);

    // Pour l'IA, exemple avec productId=1 (à adapter dynamiquement)
    final inventoryAsync = ref.watch(inventoryPredictNotifierProvider(1));
    final salesAsync     = ref.watch(salesPredictNotifierProvider);
    final deliveryAsync  = ref.watch(deliveryPredictNotifierProvider);

    Widget errorWidget(Object error) {
      return Center(
        child: Text(
          'Erreur : ${error.toString()}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord Agriculteur'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Rafraîchissement des notifiers

        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔔 Alertes de stock
              const SectionTitle('Alertes de stock'),
              alertsAsync.when(
                data: (alerts) {
                  if (alerts.results.isEmpty) {
                    return const Text('Aucune alerte en cours.', style: TextStyle(color: Colors.grey));
                  }
                  return Column(
                    children: alerts.results.take(3).map((a) => Card(
                      color: Colors.red.shade50,
                      child: ListTile(
                        leading: const Icon(Icons.warning, color: Colors.red),
                        title: Text('Produit #${a.product}'),
                        subtitle: Text('Seuil : ${a.threshold}'),
                      ),
                    )).toList(),
                  );
                },
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // 📦 Niveaux de stock
              const SectionTitle('Niveaux de stock'),
              levelsAsync.when(
                data: (levels) {
                  if (levels.results.isEmpty) {
                    return const Text('Aucun stock disponible.', style: TextStyle(color: Colors.grey));
                  }
                  return SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        barGroups: levels.results.take(5).map((e) => BarChartGroupData(
                          x: e.product,
                          barRods: [BarChartRodData(toY: e.quantity.toDouble(), width: 12)],
                        )).toList(),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  );
                },
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // 🔮 Prévision de stock
              const SectionTitle('Prévision de stock'),
              inventoryAsync.when(
                data: (list) => Column(
                  children: list.map((p) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.trending_up, color: Colors.purple),
                      title: Text('Produit #${p.productId}'),
                      subtitle: Text('Dans ${p.days} j : ${p.predictedInventory}'),
                    ),
                  )).toList(),
                ),
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // 📈 Prévision de ventes
              const SectionTitle('Prévision de ventes'),
              salesAsync.when(
                data: (list) => Column(
                  children: list.map((s) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.shopping_cart, color: Colors.green),
                      title: Text('Produit #${s.productId}'),
                      subtitle: Text('${s.period} : ${s.predictedSales}'),
                    ),
                  )).toList(),
                ),
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // 🚚 Prévision de livraison
              const SectionTitle('Prévision de livraison'),
              deliveryAsync.when(
                data: (d) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.delivery_dining, color: Colors.orange),
                      title: Text('Produit #${d.productId}'),
                      subtitle: Text('Qty: ${d.quantity}, ${d.prediction}'),
                    ),
                  );
                },
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // 🧾 Dernières commandes
              const SectionTitle('Dernières commandes'),
              ordersAsync.when(
                data: (orders) => Column(
                  children: orders.results!.take(3).map((o) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.receipt, color: Colors.blue),
                      title: Text('Commande #${o.id}'),
                      subtitle: Text('Total: \$${o.total.toStringAsFixed(2)}'),
                    ),
                  )).toList(),
                ),
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
