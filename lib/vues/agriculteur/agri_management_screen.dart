import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../fournisseurs/provider/exchange_request_provider.dart';
import '../../fournisseurs/provider/invoice_provider.dart';
import '../../fournisseurs/provider/refund_request_provider.dart';
import '../../models/exchange_status_enum.dart';
import '../../models/refund_status_enum.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/error_widget.dart';

class GestionAgriculteurScreen extends ConsumerWidget {
  const GestionAgriculteurScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text('Gestion Administrative', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Factures'),
              Tab(text: 'Échanges'),
              Tab(text: 'Retours'),
            ],
          ),
        ),
        drawer: const AppDrawer(),
        body: const TabBarView(
          children: [
            _InvoiceTab(),
            _ExchangeTab(),
            _RefundTab(),
          ],
        ),
      ),
    );
  }
}

class _InvoiceTab extends ConsumerWidget {
  const _InvoiceTab();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceNotifierProvider);
    return state.when(
      data: (data) => data.results.isEmpty 
          ? const _EmptyList(icon: Iconsax.document_text_1, message: 'Aucune facture émise')
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: data.results.length,
              separatorBuilder: (_, __) => const Gap(12),
              itemBuilder: (_, index) {
                final invoice = data.results[index];
                return _ManagementCard(
                  title: 'Facture #${invoice.id}',
                  subtitle: 'Émise le ${DateFormat('dd/MM/yyyy').format(invoice.issuedAt)}',
                  icon: Iconsax.document_download,
                  iconColor: Colors.blue,
                  trailing: const Icon(Iconsax.export, size: 20, color: Colors.grey),
                  onTap: () {},
                );
              },
            ),
      loading: () => const LoadingWidget(),
      error: (err, _) => ErrorDisplayWidget(error: err.toString()),
    );
  }
}

class _ExchangeTab extends ConsumerWidget {
  const _ExchangeTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exchangeRequestNotifierProvider);
    final notifier = ref.read(exchangeRequestNotifierProvider.notifier);

    return state.when(
      data: (data) => data.results.isEmpty
          ? const _EmptyList(icon: Iconsax.refresh_2, message: 'Aucune demande d\'échange')
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: data.results.length,
              separatorBuilder: (_, __) => const Gap(12),
              itemBuilder: (_, index) {
                final exchange = data.results[index];
                return _ManagementCard(
                  title: 'Échange #${exchange.id}',
                  subtitle: '${exchange.reason}\nStatut: ${exchange.exchangeStatus.name}',
                  icon: Iconsax.refresh,
                  iconColor: _exchangeStatusColor(exchange.exchangeStatus),
                  onTap: () => _showExchangeActions(context, notifier, exchange),
                );
              },
            ),
      loading: () => const LoadingWidget(),
      error: (err, _) => ErrorDisplayWidget(error: err.toString()),
    );
  }

  Color _exchangeStatusColor(ExchangeStatusEnum status) {
    switch (status) {
      case ExchangeStatusEnum.COMPLETED: return Colors.green;
      case ExchangeStatusEnum.PENDING: return Colors.orange;
      default: return Colors.grey;
    }
  }

  void _showExchangeActions(BuildContext context, dynamic notifier, dynamic exchange) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Action sur l\'échange', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Gap(24),
            _ActionButton(
              label: 'Accepter la demande',
              icon: Iconsax.tick_circle,
              color: Colors.green,
              onTap: () {
                notifier.accepter(exchange.id);
                Navigator.pop(context);
              },
            ),
            const Gap(12),
            _ActionButton(
              label: 'Refuser la demande',
              icon: Iconsax.close_circle,
              color: Colors.red,
              onTap: () {
                notifier.refuser(exchange.id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RefundTab extends ConsumerWidget {
  const _RefundTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(refundRequestNotifierProvider);
    final notifier = ref.read(refundRequestNotifierProvider.notifier);

    return state.when(
      data: (data) => data.isEmpty
          ? const _EmptyList(icon: Iconsax.money_change, message: 'Aucun retour en attente')
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: data.length,
              separatorBuilder: (_, __) => const Gap(12),
              itemBuilder: (_, index) {
                final refund = data[index];
                return _ManagementCard(
                  title: 'Retour #${refund.id}',
                  subtitle: '${refund.reason}\nStatut: ${refund.refundStatus?.name}',
                  icon: Iconsax.empty_wallet_change,
                  iconColor: _refundStatusColor(refund.refundStatus ?? RefundStatusEnum.pending),
                  onTap: () => _showRefundActions(context, notifier, refund),
                );
              },
            ),
      loading: () => const LoadingWidget(),
      error: (err, _) => ErrorDisplayWidget(error: err.toString()),
    );
  }

  Color _refundStatusColor(RefundStatusEnum status) {
    switch (status) {
      case RefundStatusEnum.approved: return Colors.green;
      case RefundStatusEnum.rejected: return Colors.red;
      default: return Colors.orange;
    }
  }

  void _showRefundActions(BuildContext context, dynamic notifier, dynamic refund) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Action sur le retour', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Gap(24),
            _ActionButton(
              label: 'Approuver le remboursement',
              icon: Iconsax.money_tick,
              color: Colors.green,
              onTap: () {
                notifier.approuverRemboursement(refund.id);
                Navigator.pop(context);
              },
            ),
            const Gap(12),
            _ActionButton(
              label: 'Rejeter le remboursement',
              icon: Iconsax.money_forbidden,
              color: Colors.red,
              onTap: () {
                notifier.rejeterRemboursement(refund.id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ManagementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Widget? trailing;
  final VoidCallback onTap;

  const _ManagementCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(14)),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({required this.label, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      onTap: onTap,
      tileColor: color.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}

class _EmptyList extends StatelessWidget {
  final IconData icon;
  final String message;
  const _EmptyList({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.grey.shade300),
          const Gap(12),
          Text(message, style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
