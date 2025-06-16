// lib/ui/screens/batch_management_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<void> _navigateToForm(
      BuildContext context,
      WidgetRef ref, {
        bool isEdit = false,
        Batch? batch,
      }) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BatchFormScreen(batch: isEdit ? batch : null),
      ),
    );

    if (result == true) {
      // rafraîchir la liste après création ou édition
      ref.read(batchNotifierProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1) On écoute la liste des lots
    final batchState = ref.watch(batchNotifierProvider);

    // 2) On écoute la liste paginée des produits (pour id→name)
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des lots'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(batchNotifierProvider.notifier).refresh(),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: batchState.when(
        loading: () => const LoadingWidget(),
        error: (error, _) => ErrorDisplayWidget(error: error.toString()),
        data: (batches) {
          return productsAsync.when(
            loading: () => const LoadingWidget(),
            error: (error, _) => ErrorDisplayWidget(error: 'Erreur produits : $error'),
            data: (paginatedProducts) {
              // Construire la map { idProduit → nomProduit }
              final Map<int, String> idToName = {
                for (final p in paginatedProducts.results) p.id: p.name
              };

              if (batches.isEmpty) {
                return const Center(child: Text('Aucun lot disponible.'));
              }

              return ListView.separated(
                itemCount: batches.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final batch = batches[index];
                  final productName =
                      idToName[batch.product] ?? '— Produit introuvable —';
                  final expirationFr =
                  DateFormat('dd/MM/yyyy').format(batch.expirationDate.toLocal());

                  return ListTile(
                    title: Text('Lot #${batch.lotNumber}'),
                    subtitle: Text(
                      'Produit : $productName\n'
                          'Expiration : $expirationFr',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _navigateToForm(
                            context,
                            ref,
                            isEdit: true,
                            batch: batch,
                          ),
                          tooltip: 'Modifier',
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: const Text('Confirmer la suppression'),
                                content: const Text('Voulez-vous supprimer ce lot ?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(dialogContext).pop(false),
                                    child: const Text('Annuler'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(dialogContext).pop(true),
                                    child: const Text(
                                      'Supprimer',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            if (confirm == true) {
                              ref.read(batchNotifierProvider.notifier).deleteBatch(batch.id);
                            }
                          },
                          tooltip: 'Supprimer',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToForm(context, ref),
        tooltip: 'Ajouter un lot',
        child: const Icon(Icons.add),
      ),
    );
  }
}
