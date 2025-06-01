// lib/screens/agriculteur/delivery_management_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fournisseurs/provider/delivery_person_provider.dart';
import '../../fournisseurs/provider/delivery_provider.dart';
import '../../models/delivery.dart';
  // pour paginated DeliveryPersonNotifierProvider
import '../../widgets/loading_widget.dart';

class DeliveryManagementScreen extends ConsumerWidget {
  const DeliveryManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Liste simple de Delivery
    final deliveriesAsync = ref.watch(deliveryNotifierProvider);

    // Pagination pour DeliveryPerson (si tu veux gérer les livreurs séparément)
    final pagedDeliveriesAsync = ref.watch(deliveryPersonNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Livraisons'),
        leading: const Icon(Icons.local_shipping),
      ),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // En-tête : ID & Type
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

                      // Dates
                      Text(
                        'Créé : ${d.createdAt.toLocal().toString().split(' ').first}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'Mis à jour : ${d.updatedAt.toLocal().toString().split(' ').first}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),

                      const SizedBox(height: 12),
                      // Boutons d'action
                      Wrap(
                        spacing: 8,
                        children: [
                          if (d.deliveryStatus == DeliveryStatusEnum.EN_ATTENTE)
                            ElevatedButton.icon(
                              onPressed: () {
                                ref
                                    .read(deliveryNotifierProvider.notifier)
                                    .startDelivery(d.id);
                              },
                              icon: const Icon(Icons.play_arrow),
                              label: const Text('Démarrer'),
                            ),
                          if (d.deliveryStatus == DeliveryStatusEnum.EN_COURS)
                            ElevatedButton.icon(
                              onPressed: () {
                                ref
                                    .read(deliveryNotifierProvider.notifier)
                                    .completeDelivery(d.id);
                              },
                              icon: const Icon(Icons.check),
                              label: const Text('Terminer'),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            ),
                          OutlinedButton.icon(
                            onPressed: () {
                              // TODO: ouvrir un dialog pour réassigner via deliveryPersonNotifier
                            },
                            icon: const Icon(Icons.swap_horiz),
                            label: const Text('Réassigner'),
                          ),
                          if (d.type == TypeEnum.REMBOURSEMENT)
                            OutlinedButton.icon(
                              onPressed: () {
                                ref
                                    .read(deliveryNotifierProvider.notifier)
                                    .refundDelivery(d.id);
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
      // Si tu veux ajouter la pagination DeliveryPerson en bas :
      bottomNavigationBar: pagedDeliveriesAsync.when(
        data: (page) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: page.previous != null
                    ? () => ref
                    .read(deliveryPersonNotifierProvider.notifier)
                    .loadPrevious()
                    : null,
                child: const Text('Précédent'),
              ),
              Text('${page.results.length} / ${page.count}'),
              TextButton(
                onPressed: page.next != null
                    ? () =>
                    ref.read(deliveryPersonNotifierProvider.notifier).loadNext()
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
}
