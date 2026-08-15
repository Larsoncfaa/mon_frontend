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
import '../../widgets/stock_alert_card.dart';

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
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  final idx = prods.indexWhere((p) => p.id == value.toInt());
                  if (idx == -1) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(prods[idx].name.substring(0, 3).toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: prods.map((p) => BarChartGroupData(
            x: p.id,
            barRods: [BarChartRodData(toY: (p.quantityInStock ?? 0).toDouble(), color: Colors.green, width: 20, borderRadius: BorderRadius.circular(4))],
          )).toList(),
        ),
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
