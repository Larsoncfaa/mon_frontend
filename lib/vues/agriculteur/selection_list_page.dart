import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/selection_provider.dart';
import '../../models/selection.dart';
import '../../widgets/snackbar.dart';
import 'forme/Selection_form_screen.dart';

class SelectionListPage extends ConsumerWidget {
  const SelectionListPage({super.key});

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Selection sel) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: Text("Supprimer '${sel.name}' ?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Annuler')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    ) ?? false;
    if (!ok) return;

    try {
      await ref.read(selectionNotifierProvider.notifier).deleteSelection(sel.id);
      showSnackBar(context, 'Sélection supprimée');
    } catch (e) {
      showSnackBar(context, 'Erreur : $e', isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectionNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes Sélections')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const SelectionFormPage()),
        ),
        child: const Icon(Icons.add),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
          ? Center(child: Text('Erreur : ${state.error}'))
          : ListView.builder(
        itemCount: state.selections.length,
        itemBuilder: (_, i) {
          final sel = state.selections[i];
          return ListTile(
            leading: sel.image != null
                ? Image.network(sel.image!, width: 50, height: 50, fit: BoxFit.cover)
                : const Icon(Icons.image_not_supported),
            title: Text(sel.name),
            subtitle: Text('Qté: ${sel.quantity} — Prix: ${sel.sellingPrice}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SelectionFormPage(selection: sel)),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmDelete(context, ref, sel),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
