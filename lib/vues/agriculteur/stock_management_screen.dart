import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

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

class ShowArchivedNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle(bool value) => state = value;
}

final showArchivedMovementsProvider =
NotifierProvider<ShowArchivedNotifier, bool>(
  ShowArchivedNotifier.new,
);

class StockManagementScreen extends ConsumerWidget {
  const StockManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockAlertAsync = ref.watch(stockAlertNotifierProvider);
    final stockMovementAsync = ref.watch(stockMovementNotifierProvider);
    final productAsync = ref.watch(productProvider);
    final showArchived = ref.watch(showArchivedMovementsProvider);

    Widget errorWidget(String title, Object error) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          '$title : ${error.toString()}',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 13,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Gestion du stock',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Boutons d'ajout ───────────────────────────────────────────
            if (!showArchived)
              Row(
                children: [
                  Expanded(
                    child: _ActionButton(
                      label: 'Mouvement',
                      icon: Iconsax.arrow_swap_horizontal,
                      color: Colors.indigo,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const AjouterStockMovementScreen(),
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: _ActionButton(
                      label: 'Alerte',
                      icon: Iconsax.warning_2,
                      color: Colors.red,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FormStockAlertScreen(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            if (!showArchived) const Gap(32),

            // ─── Alertes de stock ─────────────────────────────────────────
            const _SectionHeader(
              title: 'Alertes de stock',
              icon: Iconsax.notification_bing,
            ),
            const Gap(12),

            stockAlertAsync.when(
              data: (paginated) {
                final alerts = paginated.results;

                if (alerts.isEmpty) {
                  return const _EmptyState(
                    message: 'Aucune alerte de stock active.',
                  );
                }

                return Column(
                  children: alerts
                      .map(
                        (alert) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: StockAlertCard(alert: alert),
                    ),
                  )
                      .toList(),
                );
              },
              loading: () => const _LoadingPlaceholder(
                height: 100,
              ),
              error: (e, _) => errorWidget(
                'Erreur alertes',
                e,
              ),
            ),

            const Gap(32),

            // ─── Mouvements de stock ──────────────────────────────────────
            Row(
              children: [
                const Expanded(
                  child: _SectionHeader(
                    title: 'Mouvements de stock',
                    icon: Iconsax.box_time,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Archivés',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Switch(
                      value: showArchived,
                      onChanged: (val) {
                        ref
                            .read(
                          showArchivedMovementsProvider.notifier,
                        )
                            .toggle(val);
                      },
                    ),
                  ],
                ),
              ],
            ),

            const Gap(12),

            stockMovementAsync.when(
              data: (paginated) {
                final filtered = paginated.results
                    .where(
                      (m) => m.isArchived == showArchived,
                )
                    .toList();

                if (filtered.isEmpty) {
                  return _EmptyState(
                    message: showArchived
                        ? 'Aucun mouvement archivé.'
                        : 'Aucun mouvement de stock actif.',
                  );
                }

                return Column(
                  children: filtered.map((mvt) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _StockMovementCard(
                        movement: mvt,
                        onMenuSelected: (value) async {
                          final notifier = ref.read(
                            stockMovementNotifierProvider.notifier,
                          );

                          if (value == 'apply') {
                            final confirmed =
                            await showDialog<bool>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),
                                title: const Text(
                                  'Appliquer ce mouvement',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                  'Voulez-vous vraiment appliquer ce mouvement de stock ?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, false),
                                    child:
                                    const Text('Annuler'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, true),
                                    style:
                                    ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.green,
                                      foregroundColor:
                                      Colors.white,
                                    ),
                                    child:
                                    const Text('Appliquer'),
                                  ),
                                ],
                              ),
                            );

                            if (confirmed == true) {
                              try {
                                await notifier.applyStockMovement(
                                  mvt.id,
                                );

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Mouvement appliqué avec succès',
                                      ),
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Erreur lors de l’application : $e',
                                      ),
                                    ),
                                  );
                                }
                              }
                            }
                          } else if (value == 'edit') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ModifierStockMovementScreen(
                                      mouvement: mvt,
                                    ),
                              ),
                            );
                          } else if (value == 'archive') {
                            final confirmed =
                            await showDialog<bool>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),
                                title: const Text(
                                  'Confirmation',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                  'Voulez-vous vraiment archiver ce mouvement ?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, false),
                                    child:
                                    const Text('Annuler'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, true),
                                    style:
                                    ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.orange,
                                      foregroundColor:
                                      Colors.white,
                                    ),
                                    child:
                                    const Text('Confirmer'),
                                  ),
                                ],
                              ),
                            );

                            if (confirmed == true) {
                              try {
                                await notifier.archiveStockMovement(
                                  mvt.id,
                                );
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Erreur archivage : $e',
                                      ),
                                    ),
                                  );
                                }
                              }
                            }
                          } else if (value == 'restore') {
                            final confirmed =
                            await showDialog<bool>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),
                                title: const Text(
                                  'Restaurer le mouvement',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                  'Voulez-vous restaurer ce mouvement archivé ?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, false),
                                    child:
                                    const Text('Annuler'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, true),
                                    style:
                                    ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.green,
                                      foregroundColor:
                                      Colors.white,
                                    ),
                                    child:
                                    const Text('Restaurer'),
                                  ),
                                ],
                              ),
                            );

                            if (confirmed == true) {
                              try {
                                await notifier.restoreStockMovement(
                                  mvt.id,
                                );
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Erreur restauration : $e',
                                      ),
                                    ),
                                  );
                                }
                              }
                            }
                          }
                        },
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const _LoadingPlaceholder(
                height: 150,
              ),
              error: (e, _) => errorWidget(
                'Erreur mouvements',
                e,
              ),
            ),

            const Gap(32),

            // ─── Niveaux de stock ─────────────────────────────────────────
            const _SectionHeader(
              title: 'Niveaux de stock',
              icon: Iconsax.chart_2,
            ),
            const Gap(12),

            productAsync.when(
              data: (paginated) {
                final products = paginated.results;

                if (products.isEmpty) {
                  return const _EmptyState(
                    message: 'Aucun produit trouvé.',
                  );
                }

                return Column(
                  children: products.map((prod) {
                    final qty = prod.quantityInStock ?? 0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _StockLevelCard(
                        product: prod,
                        quantity: qty,
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const _LoadingPlaceholder(
                height: 150,
              ),
              error: (e, _) => errorWidget(
                'Erreur produits',
                e,
              ),
            ),

            const Gap(20),
          ],
        ),
      ),
      floatingActionButton: showArchived
          ? null
          : FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
            const AjouterStockMovementScreen(),
          ),
        ),
        backgroundColor: Colors.green,
        icon: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
        label: const Text(
          'Mouvement',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 19,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 22,
          color: Colors.black87,
        ),
        const Gap(10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _StockMovementCard extends StatelessWidget {
  final StockMovement movement;
  final Future<void> Function(String value) onMenuSelected;

  const _StockMovementCard({
    required this.movement,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isEntry =
        movement.movementType == MovementTypeEnum.in_;

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
        leading: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: (isEntry ? Colors.green : Colors.orange)
                .withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            isEntry
                ? Iconsax.arrow_down
                : Iconsax.arrow_up_3,
            color: isEntry
                ? Colors.green
                : Colors.orange,
          ),
        ),
        title: Text(
          'Produit : ${movement.productName ?? 'Inconnu'}',
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
                '${movement.movementType.name.toUpperCase()} • '
                    '${movement.quantity} unités',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),
              const Gap(3),
              Text(
                movement.timestamp.toLocal().toString(),
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 11,
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
          onSelected: onMenuSelected,
          itemBuilder: (context) {
            return [
              if (!movement.isArchived &&
                  !movement.stockApplied)
                const PopupMenuItem(
                  value: 'apply',
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.tick_circle,
                        size: 18,
                        color: Colors.green,
                      ),
                      Gap(12),
                      Text('Appliquer'),
                    ],
                  ),
                ),
              if (!movement.isArchived)
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
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
                value: movement.isArchived
                    ? 'restore'
                    : 'archive',
                child: Row(
                  children: [
                    Icon(
                      movement.isArchived
                          ? Iconsax.refresh
                          : Iconsax.archive,
                      size: 18,
                      color: movement.isArchived
                          ? Colors.green
                          : Colors.orange,
                    ),
                    const Gap(12),
                    Text(
                      movement.isArchived
                          ? 'Restaurer'
                          : 'Archiver',
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}

class _StockLevelCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const _StockLevelCard({
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final isEmpty = quantity <= 0;

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
        leading: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: (isEmpty ? Colors.red : Colors.blue)
                .withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            Iconsax.box,
            color: isEmpty ? Colors.red : Colors.blue,
          ),
        ),
        title: Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'Stock : $quantity ${product.unit.label}',
            style: TextStyle(
              color: isEmpty
                  ? Colors.red
                  : Colors.grey.shade700,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: (isEmpty ? Colors.red : Colors.green)
                .withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$quantity',
            style: TextStyle(
              color: isEmpty ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;

  const _EmptyState({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Icon(
            Iconsax.box_remove,
            size: 42,
            color: Colors.grey.shade300,
          ),
          const Gap(8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingPlaceholder extends StatelessWidget {
  final double height;

  const _LoadingPlaceholder({
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}