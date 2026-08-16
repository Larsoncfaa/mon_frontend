import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../fournisseurs/provider/stock_stats_provider.dart';
import '../../models/stock_stats.dart';
import '../../models/stock_overview.dart';
import '../../widgets/app_drawer.dart';

class StockStatsScreen extends ConsumerWidget {
  const StockStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overview = ref.watch(stockOverviewNotifierProvider);
    final stats = ref.watch(stockStatsNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Statistiques de Stock',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.refresh,
              color: Colors.black,
            ),
            tooltip: 'Actualiser',
            onPressed: () async {
              await Future.wait([
                ref
                    .read(stockOverviewNotifierProvider.notifier)
                    .loadOverview(),
                ref
                    .read(stockStatsNotifierProvider.notifier)
                    .loadStats(),
              ]);
            },
          ),
          const Gap(8),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            ref
                .read(stockOverviewNotifierProvider.notifier)
                .loadOverview(),
            ref
                .read(stockStatsNotifierProvider.notifier)
                .loadStats(),
          ]);
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            const _SectionHeader(
              title: 'Vue d’ensemble',
              icon: Iconsax.chart_2,
            ),
            const Gap(16),

            overview.when(
              data: (data) => _buildOverviewGrid(context, data),
              loading: () => const _LoadingPlaceholder(height: 180),
              error: (e, _) => _ErrorDisplay(message: '$e'),
            ),

            const Gap(32),

            const _SectionHeader(
              title: 'Analyses du stock',
              icon: Iconsax.status_up,
            ),
            const Gap(16),

            stats.when(
              data: (data) => _buildChartsSection(context, data),
              loading: () => const _LoadingPlaceholder(height: 400),
              error: (e, _) => _ErrorDisplay(message: '$e'),
            ),

            const Gap(20),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewGrid(
      BuildContext context,
      StockOverview data,
      ) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: [
        _statCard(
          context,
          'Produits',
          data.totalProducts.toString(),
          Iconsax.box,
          Colors.blue,
        ),
        _statCard(
          context,
          'Quantité Totale',
          data.totalStockQuantity.toString(),
          Iconsax.archive_1,
          Colors.green,
        ),
        _statCard(
          context,
          'Valeur Stock',
          '${data.totalStockValue.toInt()} F',
          Iconsax.empty_wallet,
          Colors.orange,
        ),
        _statCard(
          context,
          'Alertes',
          data.activeAlerts.toString(),
          Iconsax.danger,
          Colors.red,
        ),
      ],
    );
  }

  Widget _statCard(
      BuildContext context,
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const Gap(3),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartsSection(
      BuildContext context,
      StockStats data,
      ) {
    return Column(
      children: [
        _chartContainer(
          context,
          'Flux de Sortie',
          'Produits les plus sortis',
          _buildBarChart(
            data.topProducts,
            Colors.teal,
          ),
        ),
        const Gap(20),
        _chartContainer(
          context,
          'Ruptures',
          'Fréquence par produit',
          _buildRuptureChart(
            data.ruptures,
            Colors.deepOrange,
          ),
        ),
        const Gap(20),
        _chartContainer(
          context,
          'Évolution',
          'Tendance du mois',
          _buildLineChart(data.evolution),
        ),
      ],
    );
  }

  Widget _chartContainer(
      BuildContext context,
      String title,
      String subtitle,
      Widget chart,
      ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(3),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 13,
            ),
          ),
          const Gap(24),
          SizedBox(
            height: 200,
            child: chart,
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(
      List<TopProductStat> data,
      Color color,
      ) {
    if (data.isEmpty) {
      return const _EmptyState();
    }

    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: _titlesData(
          data.map((e) => e.productName).toList(),
        ),
        borderData: FlBorderData(show: false),
        barGroups: data.asMap().entries.map((e) {
          return BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value.totalOut.toDouble(),
                color: color,
                width: 18,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(6),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRuptureChart(
      List<RuptureStat> data,
      Color color,
      ) {
    if (data.isEmpty) {
      return const _EmptyState();
    }

    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: _titlesData(
          data.map((e) => e.productName).toList(),
        ),
        borderData: FlBorderData(show: false),
        barGroups: data.asMap().entries.map((e) {
          return BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value.nbRuptures.toDouble(),
                color: color,
                width: 18,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(6),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLineChart(
      List<StockEvolution> data,
      ) {
    if (data.isEmpty) {
      return const _EmptyState();
    }

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: data
                .map(
                  (e) => FlSpot(
                e.day.day.toDouble(),
                e.total.toDouble(),
              ),
            )
                .toList(),
            isCurved: true,
            color: Colors.purple,
            barWidth: 4,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.purple.withValues(alpha: 0.3),
                  Colors.purple.withValues(alpha: 0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  FlTitlesData _titlesData(
      List<String> labels,
      ) {
    return FlTitlesData(
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final idx = value.toInt();

            if (idx >= 0 && idx < labels.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  labels[idx].substring(
                    0,
                    labels[idx].length > 5
                        ? 5
                        : labels[idx].length,
                  ),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 22,
          color: Colors.black87,
        ),
        const Gap(10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Aucune donnée',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _ErrorDisplay extends StatelessWidget {
  final String message;

  const _ErrorDisplay({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}

class _LoadingPlaceholder extends StatelessWidget {
  final double height;

  const _LoadingPlaceholder({
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}