import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:maliag/fournisseurs/provider/stock_alert_provider.dart';
import 'package:maliag/fournisseurs/provider/stock_movement_provider.dart';
import 'package:maliag/fournisseurs/provider/product_provider.dart';
import 'package:maliag/models/product.dart';

import '../../models/stock_movement.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/stock_alert_card.dart';
import 'forme/form_stock_movement_screen.dart';
import 'forme/form_stock_alert_screen.dart';
import 'forme/modifier_stock_movement_screen.dart';

final showArchivedMovementsProvider = StateProvider<bool>((ref) => false);

class StockManagementScreen extends ConsumerWidget {
  const StockManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockAlertAsync = ref.watch(stockAlertNotifierProvider);
    final stockMovementAsync = ref.watch(stockMovementNotifierProvider);
    final productAsync = ref.watch(productProvider);
    final showArchived = ref.watch(showArchivedMovementsProvider);

    Widget errorWidget(String title, Object error) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text('$title : ${error.toString()}', style: const TextStyle(color: Colors.red)),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Gestion du stock')),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Boutons d'ajout ──────────────────────────────────────────────
            if (!showArchived) Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AjouterStockMovementScreen()),
                  ),
                  icon: const Icon(Icons.sync_alt, color: Colors.white),
                  label: const Text('Mouvement de stock'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FormStockAlertScreen()),
                  ),
                  icon: const Icon(Icons.warning, color: Colors.white),
                  label: const Text('Alerte de stock'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ─── Alertes de stock ─────────────────────────────────────────────
            const Text("🔔 Alertes de stock", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            stockAlertAsync.when(
              data: (paginated) {
                final alerts = paginated.results;
                if (alerts.isEmpty) {
                  return const Text("Aucune alerte de stock active.", style: TextStyle(color: Colors.grey));
                }
                return Column(
                  children: alerts.map((alert) => StockAlertCard(alert: alert)).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => errorWidget("Erreur alertes", e),
            ),

            const SizedBox(height: 24),

            // ─── Mouvements de stock ──────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("📦 Mouvements de stock", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Text("Archivés"),
                    Switch(
                      value: showArchived,
                      onChanged: (val) {
                        ref.read(showArchivedMovementsProvider.notifier).state = val;
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            stockMovementAsync.when(
              data: (paginated) {
                final filtered = paginated.results.where((m) => m.isArchived == showArchived).toList();
                if (filtered.isEmpty) {
                  return Text(
                    showArchived ? "Aucun mouvement archivé." : "Aucun mouvement de stock actif.",
                    style: const TextStyle(color: Colors.grey),
                  );
                }
                return Column(
                  children: filtered.map((mvt) {
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          mvt.movementType == MovementTypeEnum.in_
                              ? Icons.arrow_downward
                              : Icons.arrow_upward,
                          color: mvt.movementType == MovementTypeEnum.in_
                              ? Colors.green
                              : Colors.orange,
                        ),
                        title: Text('Produit : ${mvt.productName ?? 'Inconnu'}'),
                        subtitle: Text(
                          '${mvt.movementType.name.toUpperCase()} – '
                              '${mvt.quantity} unités\n'
                              '${mvt.timestamp.toLocal()}',
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) async {
                            final notifier = ref.read(stockMovementNotifierProvider.notifier);

                            if (value == 'apply') {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Appliquer ce mouvement"),
                                  content: const Text("Voulez-vous vraiment appliquer ce mouvement de stock ?"),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text("Annuler")),
                                    TextButton(onPressed: () => Navigator.pop(ctx, true),  child: const Text("Appliquer")),
                                  ],
                                ),
                              );
                              if (confirmed == true) {
                                try {
                                  await notifier.applyStockMovement(mvt.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Mouvement appliqué avec succès')),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Erreur lors de l’application : $e')),
                                  );
                                }
                              }
                            } else if (value == 'edit') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ModifierStockMovementScreen(mouvement: mvt),
                                ),
                              );
                            } else if (value == 'archive') {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Confirmation"),
                                  content: const Text("Voulez-vous vraiment archiver ce mouvement ?"),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text("Annuler")),
                                    TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text("Confirmer")),
                                  ],
                                ),
                              );
                              if (confirmed == true) {
                                try {
                                  await notifier.archiveStockMovement(mvt.id);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Erreur archivage : $e')),
                                  );
                                }
                              }
                            } else if (value == 'restore') {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Restaurer le mouvement"),
                                  content: const Text("Voulez-vous restaurer ce mouvement archivé ?"),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text("Annuler")),
                                    TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text("Restaurer")),
                                  ],
                                ),
                              );
                              if (confirmed == true) {
                                try {
                                  await notifier.restoreStockMovement(mvt.id);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Erreur restauration : $e')),
                                  );
                                }
                              }
                            }
                          },
                          itemBuilder: (context) {
                            return [
                              if (!mvt.isArchived && !mvt.stockApplied)
                                const PopupMenuItem(value: 'apply', child: Text('Appliquer')),
                              if (!mvt.isArchived)
                                const PopupMenuItem(value: 'edit', child: Text('Modifier')),
                              PopupMenuItem(
                                value: mvt.isArchived ? 'restore' : 'archive',
                                child: Text(mvt.isArchived ? 'Restaurer' : 'Archiver'),
                              ),
                            ];
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => errorWidget("Erreur mouvements", e),
            ),

            const SizedBox(height: 24),

            // ─── Niveaux de stock (lecture seule) ─────────────────────────────
            const Text("📊 Niveaux de stock", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            productAsync.when(
              data: (paginated) {
                final products = paginated.results;
                if (products.isEmpty) {
                  return const Text("Aucun produit trouvé.", style: TextStyle(color: Colors.grey));
                }
                return Column(
                  children: products.map((prod) {
                    final qty = prod.quantityInStock ?? 0;
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: const Icon(Icons.inventory, color: Colors.blueAccent),
                        title: Text(
                          prod.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                          'Stock : $qty ${prod.unit.label}',
                          style: TextStyle(
                            color: qty <= 0 ? Colors.red : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => errorWidget("Erreur produits", e),
            ),
          ],
        ),
      ),
      floatingActionButton: showArchived
          ? null
          : FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AjouterStockMovementScreen()),
        ),
        backgroundColor: Colors.blue,
        tooltip: 'Ajouter un mouvement de stock',
        child: const Icon(Icons.add),
      ),
    );
  }
}
