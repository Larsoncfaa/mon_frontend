import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../models/warehouse.dart';
import '../../../fournisseurs/provider/warehouse_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widget.dart';
import 'forme/warehouse_form_screen.dart';

class WarehouseListScreen extends ConsumerWidget {
  const WarehouseListScreen({super.key});

  Future<void> _navigateToForm(
      BuildContext context, {
        Warehouse? warehouse,
      }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => WarehouseFormScreen(warehouse: warehouse),
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context,
      WidgetRef ref,
      Warehouse warehouse,
      ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Supprimer cet entrepôt ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Voulez-vous vraiment supprimer "${warehouse.name}" ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      await ref
          .read(warehouseNotifierProvider.notifier)
          .deleteWarehouse(warehouse.id!);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Entrepôt supprimé'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur : $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(warehouseNotifierProvider);
    final notifier = ref.read(warehouseNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: const Text(
          'Gestion des Entrepôts',
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
            onPressed: () => notifier.fetchWarehouses(),
          ),
          const Gap(8),
        ],
      ),

      drawer: const AppDrawer(),

      body: state.when(
        loading: () => const LoadingWidget(),

        error: (error, _) => ErrorDisplayWidget(
          error: error.toString(),
        ),

        data: (data) {
          final warehouses = data.results;

          if (warehouses.isEmpty) {
            return _buildEmptyState(context);
          }

          return RefreshIndicator(
            onRefresh: () => notifier.fetchWarehouses(),
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: warehouses.length,
              separatorBuilder: (_, __) => const Gap(16),
              itemBuilder: (context, index) {
                final warehouse = warehouses[index];

                return _WarehouseCard(
                  warehouse: warehouse,
                  onEdit: () => _navigateToForm(
                    context,
                    warehouse: warehouse,
                  ),
                  onDelete: () => _confirmDelete(
                    context,
                    ref,
                    warehouse,
                  ),
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToForm(context),
        backgroundColor: Colors.green,
        icon: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
        label: const Text(
          'Nouvel Entrepôt',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.building_4,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const Gap(16),
          const Text(
            'Aucun entrepôt répertorié',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Gap(24),
          ElevatedButton.icon(
            onPressed: () => _navigateToForm(context),
            icon: const Icon(
              Iconsax.add,
              color: Colors.white,
            ),
            label: const Text(
              'Créer mon premier entrepôt',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WarehouseCard extends StatelessWidget {
  final Warehouse warehouse;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _WarehouseCard({
    required this.warehouse,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Iconsax.building_4,
            color: Colors.green,
          ),
        ),

        title: Text(
          warehouse.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Icon(
                Iconsax.location,
                size: 15,
                color: Colors.grey.shade600,
              ),
              const Gap(5),
              Expanded(
                child: Text(
                  warehouse.location,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),

        trailing: PopupMenuButton<String>(
          icon: const Icon(
            Iconsax.more,
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onSelected: (value) {
            if (value == 'edit') {
              onEdit();
            } else if (value == 'delete') {
              onDelete();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(
                    Iconsax.edit,
                    size: 18,
                  ),
                  Gap(12),
                  Text('Modifier'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(
                    Iconsax.trash,
                    size: 18,
                    color: Colors.red,
                  ),
                  Gap(12),
                  Text(
                    'Supprimer',
                    style: TextStyle(
                      color: Colors.red,
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