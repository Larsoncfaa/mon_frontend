import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../fournisseurs/provider/batch_provider.dart';
import '../../fournisseurs/provider/product_provider.dart';
import '../../models/batch.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widget.dart';
import 'forme/batch_form_screen.dart';

class BatchManagementScreen extends ConsumerWidget {
  const BatchManagementScreen({super.key});

  Future<void> _navigateToForm(BuildContext context, WidgetRef ref, {bool isEdit = false, Batch? batch}) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => BatchFormScreen(batch: isEdit ? batch : null)));
    if (result == true) ref.read(batchNotifierProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchState = ref.watch(batchNotifierProvider);
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Gestion des Lots', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Iconsax.refresh, color: Colors.black), onPressed: () => ref.read(batchNotifierProvider.notifier).refresh()),
          const Gap(8),
        ],
      ),
      drawer: const AppDrawer(),
      body: batchState.when(
        loading: () => const LoadingWidget(),
        error: (error, _) => ErrorDisplayWidget(error: error.toString()),
        data: (batches) => productsAsync.when(
          loading: () => const LoadingWidget(),
          error: (error, _) => ErrorDisplayWidget(error: 'Erreur produits : $error'),
          data: (paginatedProducts) {
            final Map<int, String> idToName = {for (final p in paginatedProducts.results) p.id: p.name};
            if (batches.isEmpty) return _buildEmptyState(context, ref);

            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: batches.length,
              separatorBuilder: (_, __) => const Gap(16),
              itemBuilder: (context, index) {
                final batch = batches[index];
                final productName = idToName[batch.product] ?? 'Produit inconnu';
                return _BatchCard(
                  batch: batch,
                  productName: productName,
                  onEdit: () => _navigateToForm(context, ref, isEdit: true, batch: batch),
                  onDelete: () => _confirmDelete(context, ref, batch.id),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToForm(context, ref),
        backgroundColor: Colors.green,
        icon: const Icon(Iconsax.add, color: Colors.white),
        label: const Text('Nouveau Lot', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.box_remove, size: 64, color: Colors.grey.shade300),
          const Gap(16),
          const Text('Aucun lot répertorié', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const Gap(24),
          ElevatedButton(
            onPressed: () => _navigateToForm(context, ref),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Créer mon premier lot'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Supprimer ce lot ?', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Cette action est irréversible.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
    if (confirm == true) ref.read(batchNotifierProvider.notifier).deleteBatch(id);
  }
}

class _BatchCard extends StatelessWidget {
  final Batch batch;
  final String productName;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _BatchCard({required this.batch, required this.productName, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(14)),
              child: const Icon(Iconsax.box_1, color: Colors.green),
            ),
            title: Text('Lot #${batch.lotNumber}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(4),
                Text('Produit: $productName', style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
                Text('Expire le: ${DateFormat('dd/MM/yyyy').format(batch.expirationDate)}', style: TextStyle(color: Colors.redAccent.shade100, fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
            trailing: PopupMenuButton(
              icon: const Icon(Iconsax.more, color: Colors.grey),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              itemBuilder: (ctx) => [
                PopupMenuItem(onTap: onEdit, child: const Row(children: [Icon(Iconsax.edit, size: 18), Gap(12), Text('Modifier')])),
                PopupMenuItem(onTap: onDelete, child: const Row(children: [Icon(Iconsax.trash, size: 18, color: Colors.red), Gap(12), Text('Supprimer', style: TextStyle(color: Colors.red))])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
