import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../fournisseurs/provider/stock_stats_providers.dart';
import '../../models/stock_stats.dart';
import '../../models/stock_overview.dart';

class StockStatsScreen extends ConsumerWidget {
  const StockStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overview = ref.watch(stockOverviewNotifierProvider);
    final stats = ref.watch(stockStatsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques de stock'),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(stockOverviewNotifierProvider.notifier).loadOverview();
          ref.read(stockStatsNotifierProvider.notifier).loadStats();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            overview.when(
              data: (data) => _buildOverviewCards(context, data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erreur: $e'),
            ),
            const SizedBox(height: 16),
            stats.when(
              data: (data) => _buildCharts(context, data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erreur: $e'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCards(BuildContext context, StockOverview data) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _statCard(context, 'Produits', data.totalProducts, Colors.blue),
        _statCard(context, 'Quantité totale', data.totalStockQuantity, Colors.green),
        _statCard(context, 'Valeur stock (f)', data.totalStockValue.toInt(), Colors.orange),
        _statCard(context, 'Alertes actives', data.activeAlerts, Colors.red),
      ],
    );
  }

  Widget _statCard(BuildContext context, String title, int value, Color color) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('$value', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCharts(BuildContext context, StockStats data) {
    return Column(
      children: [
        _buildSection(context, 'Produits les plus sortis', _buildBarChartFromTopProducts(data.topProducts)),
        _buildSection(context, 'Ruptures par produit', _buildBarChartFromRuptures(data.ruptures)),
        _buildSection(context, "Évolution du stock (mois en cours)", _buildLineChartFromStats(data.evolution)),
      ],
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget chart) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            chart,
          ],
        ),
      ),
    );
  }

  Widget _buildBarChartFromTopProducts(List<TopProductStat> data) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: data.asMap().entries.map((entry) {
            final i = entry.key;
            final stat = entry.value;
            return BarChartGroupData(x: i, barRods: [
              BarChartRodData(toY: stat.totalOut.toDouble(), color: Colors.teal, width: 16, borderRadius: BorderRadius.circular(4)),
            ]);
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < data.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        data[index].productName,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBarChartFromRuptures(List<RuptureStat> data) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: data.asMap().entries.map((entry) {
            final i = entry.key;
            final stat = entry.value;
            return BarChartGroupData(x: i, barRods: [
              BarChartRodData(toY: stat.nbRuptures.toDouble(), color: Colors.deepOrange, width: 16, borderRadius: BorderRadius.circular(4)),
            ]);
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < data.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        data[index].productName,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineChartFromStats(List<StockEvolution> data) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: data.map((e) => FlSpot(e.day.day.toDouble(), e.total.toDouble())).toList(),
              isCurved: true,
              color: Colors.purple,
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: true, color: Colors.purple.withOpacity(0.2)),
            )
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text('${value.toInt()}', style: const TextStyle(fontSize: 10)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
