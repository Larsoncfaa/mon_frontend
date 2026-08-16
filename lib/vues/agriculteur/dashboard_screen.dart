import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../fournisseurs/provider/order_provider.dart';
import '../../fournisseurs/provider/stock_alert_provider.dart';
import '../../fournisseurs/provider/product_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import 'package:maliag/widgets/stock_alert_card.dart';

class DashboardAgriculteurScreen extends ConsumerWidget {
  const DashboardAgriculteurScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsAsync = ref.watch(stockAlertNotifierProvider);
    final productsAsync = ref.watch(productProvider);
    final ordersAsync = ref.watch(orderNotifierProvider);

    Future<void> refreshAll() async {
      await Future.wait([
        ref.read(stockAlertNotifierProvider.notifier).fetchStockAlerts(page: 1),
        ref.read(productProvider.notifier).fetchProducts(),
        ref.read(orderNotifierProvider.notifier).fetchOrders(),
      ]);
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.profile_circle),
            tooltip: 'Profil',
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
          const Gap(8),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: refreshAll,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Welcome Header ───────────────────────────────────────────
              _buildHeader(context),
              const Gap(24),

              // ─── Quick Stats Card ──────────────────────────────────────────
              _buildStatsQuickAccess(context),
              const Gap(32),

              // ─── Stock Alerts ───────────────────────────────────────────
              const _SectionHeader(title: 'Alertes de stock', icon: Iconsax.notification_bing),
              const Gap(12),
              alertsAsync.when(
                data: (paginated) {
                  final alerts = paginated.results;
                  if (alerts.isEmpty) {
                    return const _EmptyState(message: 'Tout est en ordre.');
                  }
                  return Column(
                    children: [
                      ...alerts.take(3).map((a) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: StockAlertCard(alert: a),
                      )),
                      if (alerts.length > 3)
                        _buildViewMore(context, '/stock'),
                    ],
                  );
                },
                loading: () => const _ShimmerLoader(height: 100),
                error: (e, _) => _ErrorState(message: '$e'),
              ),
              const Gap(32),

              // ─── Stock Bar Chart ──────────────────────────────────────────
              const _SectionHeader(title: 'Niveaux de stock', icon: Iconsax.chart_2),
              const Gap(16),
              productsAsync.when(
                data: (paginated) {
                  final prods = paginated.results;
                  if (prods.isEmpty) return const _EmptyState(message: 'Aucun produit.');
                  return _buildBarChart(context, prods.take(5).toList());
                },
                loading: () => const _ShimmerLoader(height: 200),
                error: (e, _) => _ErrorState(message: '$e'),
              ),
              const Gap(32),

              // ─── Recent Orders ───────────────────────────────────────────
              const _SectionHeader(title: 'Dernières commandes', icon: Iconsax.receipt_2),
              const Gap(12),
              ordersAsync.when(
                data: (paginated) {
                  final orders = paginated.results;
                  if (orders.isEmpty) return const _EmptyState(message: 'Aucune commande.');
                  return Column(
                    children: orders.take(3).map((o) => _buildOrderTile(context, o)).toList(),
                  );
                },
                loading: () => const _ShimmerLoader(height: 150),
                error: (e, _) => _ErrorState(message: '$e'),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bonjour 👋', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
        Text('Prêt pour la récolte ?', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStatsQuickAccess(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/stock-stats'),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade600, Colors.green.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.green.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 8)),
          ],
        ),
        child: Row(
          children: [
            const Icon(Iconsax.status_up, color: Colors.white, size: 40),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Rapport de Stock', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Analysez vos performances de vente', style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 13)),
                ],
              ),
            ),
            const Icon(Iconsax.arrow_right_3, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(BuildContext context, List prods) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Hauteur adaptée à la taille de l'écran
    final chartHeight = screenWidth < 600
        ? 220.0
        : screenWidth < 1000
        ? 260.0
        : 300.0;

    // On limite l'affichage à quelques produits pour garder
    // le graphe lisible et indicatif.
    final displayedProducts = prods.take(6).toList();

    if (displayedProducts.isEmpty) {
      return const _EmptyState(
        message: 'Aucune donnée de stock disponible.',
      );
    }

    return Container(
      width: double.infinity,
      height: chartHeight,
      padding: EdgeInsets.all(screenWidth < 600 ? 12 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aperçu du stock',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Quantité disponible par produit',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: BarChart(
              BarChartData(
                minY: 0,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withValues(alpha: 0.12),
                      strokeWidth: 1,
                    );
                  },
                ),

                borderData: FlBorderData(show: false),

                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final product = displayedProducts[groupIndex];

                      return BarTooltipItem(
                        '${product.name}\n'
                            'Stock : ${product.quantityInStock ?? 0} ${product.unit.name}',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),


                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: screenWidth >= 500,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: screenWidth < 600 ? 32 : 40,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();

                        if (index < 0 ||
                            index >= displayedProducts.length) {
                          return const SizedBox.shrink();
                        }

                        final name =
                        displayedProducts[index].name.toString();

                        final shortName = name.length > 6
                            ? '${name.substring(0, 6)}...'
                            : name;

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            shortName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenWidth < 600 ? 9 : 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                barGroups: displayedProducts.asMap().entries.map((entry) {
                  final index = entry.key;
                  final product = entry.value;

                  final quantity =
                  (product.quantityInStock ?? 0).toDouble();

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: quantity,
                        width: screenWidth < 600 ? 18 : 24,
                        color: Colors.green,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTile(BuildContext context, dynamic o) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.blue.shade50, shape: BoxShape.circle),
          child: const Icon(Iconsax.receipt_2, color: Colors.blue, size: 20),
        ),
        title: Text('Commande #${o.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Total: ${o.total.toStringAsFixed(0)} F'),
        trailing: const Icon(Iconsax.arrow_right_3, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildViewMore(BuildContext context, String route) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: () => Navigator.pushNamed(context, route),
        icon: const Text('Voir tout'),
        label: const Icon(Iconsax.arrow_right_1, size: 16),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.black87),
        const Gap(10),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});
  @override
  Widget build(BuildContext context) => Center(child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Text(message, style: const TextStyle(color: Colors.grey)),
  ));
}

class _ErrorState extends StatelessWidget {
  final String message;
  const _ErrorState({required this.message});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12)),
    child: Text(message, style: const TextStyle(color: Colors.red, fontSize: 12)),
  );
}

class _ShimmerLoader extends StatelessWidget {
  final double height;
  const _ShimmerLoader({required this.height});
  @override
  Widget build(BuildContext context) => Container(
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
    child: const Center(child: CircularProgressIndicator()),
  );
}
