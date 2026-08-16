import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../fournisseurs/provider/selection_provider.dart';
import '../../models/selection.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/snackbar.dart';
import 'forme/Selection_form_screen.dart';

class SelectionListPage extends ConsumerWidget {
  const SelectionListPage({super.key});

  Future<void> _confirmDelete(
      BuildContext context,
      WidgetRef ref,
      Selection sel,
      ) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Confirmer la suppression',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text("Supprimer '${sel.name}' ?"),
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
    ) ??
        false;

    if (!ok) return;

    try {
      await ref
          .read(selectionNotifierProvider.notifier)
          .deleteSelection(sel.id);

      showSnackBar(context, 'Sélection supprimée');
    } catch (e) {
      showSnackBar(
        context,
        'Erreur : $e',
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectionNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Mes Sélections',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Gap(8),
        ],
      ),
      drawer: const AppDrawer(),
      body: state.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : state.error != null
          ? Center(
        child: Text(
          'Erreur : ${state.error}',
        ),
      )
          : state.selections.isEmpty
          ? _buildEmptyState(context)
          : ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: state.selections.length,
        separatorBuilder: (_, __) => const Gap(16),
        itemBuilder: (_, i) {
          final sel = state.selections[i];

          return _SelectionCard(
            selection: sel,
            onEdit: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SelectionFormPage(
                  selection: sel,
                ),
              ),
            ),
            onDelete: () => _confirmDelete(
              context,
              ref,
              sel,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const SelectionFormPage(),
          ),
        ),
        backgroundColor: Colors.green,
        icon: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
        label: const Text(
          'Nouvelle Sélection',
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
            Iconsax.task_square,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const Gap(16),
          const Text(
            'Aucune sélection',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Gap(24),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const SelectionFormPage(),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Créer ma première sélection'),
          ),
        ],
      ),
    );
  }
}

class _SelectionCard extends StatelessWidget {
  final Selection selection;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _SelectionCard({
    required this.selection,
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
        contentPadding: const EdgeInsets.all(14),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: selection.image != null
              ? Image.network(
            selection.image!,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _imagePlaceholder(),
          )
              : _imagePlaceholder(),
        ),
        title: Text(
          selection.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Qté : ${selection.quantity}',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),
              const Gap(3),
              Text(
                'Prix : ${selection.sellingPrice}',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        trailing: PopupMenuButton(
          icon: const Icon(
            Iconsax.more,
            color: Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          itemBuilder: (ctx) => [
            PopupMenuItem(
              onTap: onEdit,
              child: const Row(
                children: [
                  Icon(
                    Iconsax.edit,
                    size: 18,
                    color: Colors.blue,
                  ),
                  Gap(12),
                  Text('Modifier'),
                ],
              ),
            ),
            PopupMenuItem(
              onTap: onDelete,
              child: const Row(
                children: [
                  Icon(
                    Iconsax.trash,
                    size: 18,
                    color: Colors.red,
                  ),
                  Gap(12),
                  Text(
                    'Supprimer',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Icon(
        Iconsax.image,
        color: Colors.grey,
      ),
    );
  }
}