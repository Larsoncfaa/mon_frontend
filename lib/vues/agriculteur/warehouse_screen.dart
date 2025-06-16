import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/warehouse.dart';
import '../../../fournisseurs/provider/warehouse_provider.dart';
import '../../widgets/app_drawer.dart';
import 'forme/warehouse_form_screen.dart';

class WarehouseListScreen extends ConsumerWidget {
  const WarehouseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(warehouseNotifierProvider);
    final notifier = ref.read(warehouseNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des entrepôts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.fetchWarehouses(),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const WarehouseFormScreen()),
        ),
        child: const Icon(Icons.add),
      ),
      body: state.when(
        data: (data) => ListView.builder(
          itemCount: data.results.length,
          itemBuilder: (_, index) {
            final Warehouse warehouse = data.results[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(warehouse.name),
                subtitle: Text(warehouse.location),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'edit') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WarehouseFormScreen(warehouse: warehouse),
                        ),
                      );
                    } else if (value == 'delete') {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Confirmation'),
                          content: const Text('Supprimer cet entrepôt ?'),
                          actions: [
                            TextButton(
                              child: const Text('Annuler'),
                              onPressed: () => Navigator.pop(context, false),
                            ),
                            TextButton(
                              child: const Text('Supprimer'),
                              onPressed: () => Navigator.pop(context, true),
                            ),
                          ],
                        ),
                      );
                      if (confirm == true) {
                        await notifier.deleteWarehouse(warehouse.id!);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Entrepôt supprimé')),
                          );
                        }
                      }
                    }
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'edit', child: Text('Modifier')),
                    PopupMenuItem(value: 'delete', child: Text('Supprimer')),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Erreur : $err')),
      ),
    );
  }
}
