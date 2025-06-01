import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maliag/models/batch.dart';

import '../../fournisseurs/provider/batch_provider.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widget.dart';

class BatchManagementScreen extends ConsumerWidget {
  const BatchManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchState = ref.watch(batchNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des lots'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(batchNotifierProvider.notifier).refresh(),
          )
        ],
      ),
      body: batchState.when(
        data: (data) {
          final batches = data.results;

          return ListView.separated(
            itemCount: batches.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final batch = batches[index];
              return ListTile(
                title: Text('Lot #${batch.code}'),
                subtitle: Text('Produit ID: ${batch.product}\nQuantité: ${batch.quantity}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Naviguer vers le formulaire d'édition
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Supprimer le lot
                        ref.read(batchNotifierProvider.notifier).deleteBatch(batch.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, _) => ErrorDisplayWidget(error: error.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers le formulaire d'ajout
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

extension on List<Batch> {
   get results => null;
}
