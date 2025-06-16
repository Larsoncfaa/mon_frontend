import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../fournisseurs/provider/order_provider.dart';
import '../../fournisseurs/provider/stock_alert_provider.dart';
import '../../fournisseurs/provider/product_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/stock_alert_card.dart';

class DashboardAgriculteurScreen extends ConsumerWidget {
  const DashboardAgriculteurScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsAsync = ref.watch(stockAlertNotifierProvider);
    final productsAsync = ref.watch(productProvider);
    final ordersAsync = ref.watch(orderNotifierProvider);

    Future<void> _refreshAll() {
      return Future.wait([
        ref.read(stockAlertNotifierProvider.notifier).fetchStockAlerts(page: 1),
        ref.read(productProvider.notifier).fetchProducts(),
        ref.read(orderNotifierProvider.notifier).fetchOrders(),
      ]);
    }

    Widget errorWidget(Object error) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text('Erreur : ${error.toString()}', style: const TextStyle(color: Colors.red)),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Tableau de bord Agriculteur'),
          actions: [
          IconButton(
          icon: const Icon(Icons.person),
      tooltip: 'Voir le profil',
      onPressed: () {
        Navigator.pushNamed(context, '/profile');
      },
    ),
    ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshAll,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Alertes de stock ───────────────────────────────────────────
              const SectionTitle('🔔 Alertes de stock'),
              const SizedBox(height: 8),
              alertsAsync.when(
                data: (paginated) {
                  final alerts = paginated.results;
                  if (alerts.isEmpty) {
                    return const Text('Aucune alerte en cours.', style: TextStyle(color: Colors.grey));
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...alerts.take(3).map((a) => StockAlertCard(alert: a)),
                      if (alerts.length > 3)
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // TODO: Naviguer vers la liste complète des alertes
                            },
                            child: const Text('Voir toutes les alertes'),
                          ),
                        ),
                    ],
                  );
                },
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // ─── Niveaux de stock ──────────────────────────────────────────
              const SectionTitle('📊 Niveaux de stock'),
              const SizedBox(height: 8),
              productsAsync.when(
                data: (paginated) {
                  final prods = paginated.results;
                  if (prods.isEmpty) {
                    return const Text('Aucun produit disponible.', style: TextStyle(color: Colors.grey));
                  }

                  final chartData = prods.take(5).toList();

                  return SizedBox(
                    height: 220,
                    child: BarChart(
                      BarChartData(
                        barGroups: chartData.map((p) {
                          return BarChartGroupData(
                            x: p.id,
                            barRods: [
                              BarChartRodData(
                                toY: (p.quantityInStock ?? 0).toDouble(),
                                width: 14,
                                color: Colors.green,
                              )
                            ],
                            showingTooltipIndicators: [0],
                          );
                        }).toList(),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                final idx = chartData.indexWhere((p) => p.id == value.toInt());
                                if (idx == -1) return const SizedBox.shrink();
                                return Text(chartData[idx].name, style: const TextStyle(fontSize: 10));
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: true, drawHorizontalLine: true),
                      ),
                    ),
                  );
                },
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // ─── Dernières commandes ───────────────────────────────────────
              const SectionTitle('🧾 Dernières commandes'),
              const SizedBox(height: 8),
              ordersAsync.when(
                data: (paginated) {
                  final orders = paginated.results;
                  if (orders == null || orders.isEmpty) {
                    return const Text(
                      'Aucune commande.',
                      style: TextStyle(color: Colors.grey),
                    );
                  }

                  return Column(
                    children: orders.take(3).map((o) {
                      // Sécurise le total au cas où il serait mal converti
                      final double? total = (o.total is num)
                          ? (o.total as num).toDouble()
                          : double.tryParse(o.total.toString());

                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(Icons.receipt_long,
                              color: Colors.blue, size: 32),
                          title: Text(
                            'Commande #${o.id}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'Total : ${total?.toStringAsFixed(2) ?? "0.00"} F',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
                loading: () => const Center(child: LoadingWidget()),
                error: (e, _) => errorWidget(e),
              ),
              const SizedBox(height: 24),

              // ─── Statistiques de stock ──────────────────────────────────────
              const SectionTitle('📈 Statistiques de stock'),
              const SizedBox(height: 8),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: Colors.indigo.shade50,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading: Icon(Icons.bar_chart, size: 40, color: Colors.indigo.shade700),
                  title: const Text('Voir les statistiques de stock', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Produits les plus sortis, ruptures, évolution...'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, '/stock-stats');
                  },
                ),
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
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
  );
}
