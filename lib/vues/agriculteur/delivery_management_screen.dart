import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../fournisseurs/provider/delivery_person_provider.dart';
import '../../fournisseurs/provider/delivery_provider.dart';
import '../../models/delivery.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/loading_widget.dart';
import 'forme/create_delivery_person_screen.dart';

class DeliveryManagementScreen extends ConsumerWidget {
  const DeliveryManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveriesAsync = ref.watch(deliveryNotifierProvider);
    final pagedDeliveryPersonsAsync = ref.watch(deliveryPersonNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Livraisons'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            tooltip: 'Ajouter un livreur',
            icon: const Icon(Icons.delivery_dining),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateDeliveryPersonScreen()),
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: deliveriesAsync.when(
        data: (deliveries) {
          if (deliveries.isEmpty) {
            return const Center(child: Text('Aucune livraison trouvée.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            itemCount: deliveries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final d = deliveries[i];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            d.type == TypeEnum.LIVRAISON
                                ? Icons.local_shipping
                                : d.type == TypeEnum.STOCK
                                ? Icons.storage
                                : d.type == TypeEnum.REMBOURSEMENT
                                ? Icons.monetization_on
                                : Icons.help_outline,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '#${d.id} • ${d.type.name}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            d.deliveryStatus?.name ?? '—',
                            style: TextStyle(
                              color: d.deliveryStatus == DeliveryStatusEnum.TERMINEE
                                  ? Colors.green
                                  : d.deliveryStatus == DeliveryStatusEnum.EN_COURS
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(d.description),
                      const SizedBox(height: 8),
                      Text(
                        'Créé : ${d.createdAt.toLocal().toString().split(' ').first}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'Mis à jour : ${d.updatedAt.toLocal().toString().split(' ').first}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          if (d.deliveryStatus == DeliveryStatusEnum.EN_ATTENTE)
                            ElevatedButton.icon(
                              onPressed: () {
                                ref.read(deliveryNotifierProvider.notifier).startDelivery(d.id);
                              },
                              icon: const Icon(Icons.play_arrow),
                              label: const Text('Démarrer'),
                            ),
                          if (d.deliveryStatus == DeliveryStatusEnum.EN_COURS)
                            ElevatedButton.icon(
                              onPressed: () {
                                ref.read(deliveryNotifierProvider.notifier).completeDelivery(d.id);
                              },
                              icon: const Icon(Icons.check),
                              label: const Text('Terminer'),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            ),
                          OutlinedButton.icon(
                            onPressed: () => _showReassignDialog(context, ref, d.id),
                            icon: const Icon(Icons.swap_horiz),
                            label: const Text('Réassigner'),
                          ),
                          if (d.type == TypeEnum.REMBOURSEMENT)
                            OutlinedButton.icon(
                              onPressed: () {
                                ref.read(deliveryNotifierProvider.notifier).refundDelivery(d.id);
                              },
                              icon: const Icon(Icons.monetization_on),
                              label: const Text('Rembourser'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: LoadingWidget()),
        error: (e, _) => Center(
          child: Text('Erreur : ${e.toString()}', style: const TextStyle(color: Colors.red)),
        ),
      ),
      bottomNavigationBar: pagedDeliveryPersonsAsync.when(
        data: (page) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: page.previous != null
                    ? () => ref.read(deliveryPersonNotifierProvider.notifier).loadPrevious()
                    : null,
                child: const Text('Précédent'),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${page.results.length} / ${page.count}'),
                  const SizedBox(width: 8),
                  PopupMenuButton<int>(
                    tooltip: 'Actions livreurs',
                    itemBuilder: (ctx) => page.results.map((dp) {
                      return PopupMenuItem(
                        value: dp.id,
                        child: Text('Supprimer Livreur #${dp.id}'),
                      );
                    }).toList(),
                    onSelected: (id) => _confirmDeleteLivreur(context, ref, id),
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
              TextButton(
                onPressed: page.next != null
                    ? () => ref.read(deliveryPersonNotifierProvider.notifier).loadNext()
                    : null,
                child: const Text('Suivant'),
              ),
            ],
          ),
        ),
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }

  void _showReassignDialog(BuildContext context, WidgetRef ref, int deliveryId) {
    final deliveryPersons = ref.read(deliveryPersonNotifierProvider).value?.results ?? [];

    if (deliveryPersons.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aucun livreur disponible pour la réassignation')),
      );
      return;
    }

    int? selectedUserId;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Réassigner la livraison'),
          content: StatefulBuilder(
            builder: (context, setState) => DropdownButtonFormField<int>(
              isExpanded: true,
              items: deliveryPersons.map((dp) {
                return DropdownMenuItem(
                  value: dp.user,
                  child: Text('Livreur #${dp.id} • ${dp.phone}'),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedUserId = value),
              decoration: const InputDecoration(labelText: 'Choisir un livreur'),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: selectedUserId != null
                  ? () async {
                await ref.read(deliveryPersonNotifierProvider.notifier)
                    .reassign(deliveryId, selectedUserId!);
                Navigator.of(context).pop();
              }
                  : null,
              child: const Text('Réassigner'),
            ),
          ],
        );
      },
    );
  }


  void _confirmDeleteLivreur(BuildContext context, WidgetRef ref, int id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Supprimer le livreur'),
        content: const Text('Voulez-vous vraiment supprimer ce livreur ? Cette action est irréversible.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.delete),
            label: const Text('Supprimer'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(context);
              try {
                await ref.read(deliveryPersonNotifierProvider.notifier).delete(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Livreur supprimé avec succès')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erreur lors de la suppression: $e')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
