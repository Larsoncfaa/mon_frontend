import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';

import '../../fournisseurs/provider/payment_log_provider.dart';
import '../../fournisseurs/provider/proof_provider.dart';
import '../../fournisseurs/provider/tracking_info_provider.dart';
import '../../models/payment_log.dart';
import '../../models/proof.dart';
import '../../models/tracking_info.dart';
import '../../widgets/app_drawer.dart';

class SuiviLogistiqueAgriculteurScreen extends ConsumerStatefulWidget {
  const SuiviLogistiqueAgriculteurScreen({super.key});

  @override
  ConsumerState<SuiviLogistiqueAgriculteurScreen> createState() =>
      _SuiviLogistiqueAgriculteurScreenState();
}

class _SuiviLogistiqueAgriculteurScreenState
    extends ConsumerState<SuiviLogistiqueAgriculteurScreen> {
  final TextEditingController _searchController = TextEditingController();

  String searchQuery = '';
  DateTime? selectedDate;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────────────────────────────────
  // EXPORT CSV
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> _exportCsv(
      BuildContext context,
      List<PaymentLog> payments,
      List<Proof> proofs,
      List<TrackingInfo> trackings,
      ) async {
    final buffer = StringBuffer();

    buffer.writeln('Paiements');
    buffer.writeln('Statut,Montant,Date');

    for (final p in payments) {
      buffer.writeln(
        '${p.status},${p.amount},${DateFormat('yyyy-MM-dd').format(p.attemptTime)}',
      );
    }

    buffer.writeln();
    buffer.writeln('Preuves');
    buffer.writeln('ID,Lien,Date');

    for (final pr in proofs) {
      buffer.writeln(
        '${pr.id},${pr.image},${DateFormat('yyyy-MM-dd').format(pr.uploadedAt)}',
      );
    }

    buffer.writeln();
    buffer.writeln('Suivi');
    buffer.writeln('Statut,Localisation,Date');

    for (final t in trackings) {
      buffer.writeln(
        '${t.status},${t.location},${DateFormat('yyyy-MM-dd').format(t.updatedAt)}',
      );
    }

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/suivi_logistique.csv');

    await file.writeAsString(buffer.toString());

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CSV enregistré : ${file.path}'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // EXPORT PDF
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> _exportPdf(
      BuildContext context,
      List<PaymentLog> payments,
      List<Proof> proofs,
      List<TrackingInfo> trackings,
      ) async {
    final buffer = StringBuffer();

    buffer.writeln('Suivi logistique');
    buffer.writeln();

    buffer.writeln('Paiements');

    for (final p in payments) {
      buffer.writeln(
        '- ${p.status} : ${p.amount}€ '
            '(${DateFormat('yyyy-MM-dd').format(p.attemptTime)})',
      );
    }

    buffer.writeln();
    buffer.writeln('Preuves');

    for (final pr in proofs) {
      buffer.writeln(
        '- ${pr.image} '
            '(${DateFormat('yyyy-MM-dd').format(pr.uploadedAt)})',
      );
    }

    buffer.writeln();
    buffer.writeln('Suivi');

    for (final t in trackings) {
      buffer.writeln(
        '- ${t.status} @${t.location} '
            '(${DateFormat('yyyy-MM-dd').format(t.updatedAt)})',
      );
    }

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/suivi_logistique.pdf');

    await file.writeAsString(buffer.toString());

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF enregistré : ${file.path}'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // DATE
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void _clearFilters() {
    setState(() {
      searchQuery = '';
      selectedDate = null;
      _searchController.clear();
    });
  }

  bool _matchesDate(DateTime date) {
    return selectedDate == null || DateUtils.isSameDay(date, selectedDate);
  }

  // ─────────────────────────────────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final paymentLogState = ref.watch(paymentLogNotifierProvider);
    final proofState = ref.watch(proofNotifierProvider);
    final trackingState = ref.watch(trackingInfoNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: const Text(
          'Suivi logistique',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Iconsax.export_1,
              color: Colors.black87,
            ),
            tooltip: 'Exporter',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onSelected: (value) async {
              final payments =
                  paymentLogState.value?.results ?? <PaymentLog>[];

              final proofs =
                  proofState.value?.results ?? <Proof>[];

              final trackings =
                  trackingState.value?.results ?? <TrackingInfo>[];

              if (value == 'pdf') {
                await _exportPdf(
                  context,
                  payments,
                  proofs,
                  trackings,
                );
              } else if (value == 'csv') {
                await _exportCsv(
                  context,
                  payments,
                  proofs,
                  trackings,
                );
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'pdf',
                child: Row(
                  children: [
                    Icon(Iconsax.document_text, size: 19),
                    Gap(10),
                    Text('Exporter en PDF'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'csv',
                child: Row(
                  children: [
                    Icon(Iconsax.document_download, size: 19),
                    Gap(10),
                    Text('Exporter en CSV'),
                  ],
                ),
              ),
            ],
          ),
          const Gap(8),
        ],
      ),

      drawer: const AppDrawer(),

      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(paymentLogNotifierProvider);
          ref.invalidate(proofNotifierProvider);
          ref.invalidate(trackingInfoNotifierProvider);
        },

        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            // ───────────────────────────────────────────────────────────────
            // HEADER
            // ───────────────────────────────────────────────────────────────

            const Text(
              'Suivi de votre logistique',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Gap(6),

            Text(
              'Consultez les paiements, preuves et livraisons.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),

            const Gap(24),

            // ───────────────────────────────────────────────────────────────
            // RECHERCHE
            // ───────────────────────────────────────────────────────────────

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  prefixIcon: const Icon(
                    Iconsax.search_normal,
                    color: Colors.grey,
                  ),
                  suffixIcon: searchQuery.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Iconsax.close_circle),
                    onPressed: () {
                      setState(() {
                        searchQuery = '';
                        _searchController.clear();
                      });
                    },
                  )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),

            const Gap(12),

            // ───────────────────────────────────────────────────────────────
            // FILTRES
            // ───────────────────────────────────────────────────────────────

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _selectDate,
                    icon: const Icon(Iconsax.calendar_1, size: 18),
                    label: Text(
                      selectedDate == null
                          ? 'Filtrer par date'
                          : DateFormat('dd/MM/yyyy')
                          .format(selectedDate!),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      side: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),

                if (selectedDate != null || searchQuery.isNotEmpty) ...[
                  const Gap(10),
                  IconButton(
                    onPressed: _clearFilters,
                    tooltip: 'Réinitialiser',
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.red.shade50,
                    ),
                    icon: const Icon(
                      Iconsax.refresh,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ],
            ),

            const Gap(28),

            // ───────────────────────────────────────────────────────────────
            // PAIEMENTS
            // ───────────────────────────────────────────────────────────────

            const _SectionHeader(
              title: 'Paiements',
              icon: Iconsax.card,
              color: Colors.green,
            ),

            const Gap(12),

            paymentLogState.when(
              data: (paginated) {
                final filtered = paginated.results.where((log) {
                  final matchesSearch =
                  log.status.toLowerCase().contains(searchQuery);

                  final matchesDate =
                  _matchesDate(log.attemptTime);

                  return matchesSearch && matchesDate;
                }).toList();

                if (filtered.isEmpty) {
                  return const _EmptyState(
                    icon: Iconsax.card_remove,
                    message: 'Aucun paiement trouvé.',
                  );
                }

                return Column(
                  children: filtered
                      .map(
                        (log) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _PaymentLogTile(
                        log,
                        onDelete: () async {
                          await ref
                              .read(
                            paymentLogNotifierProvider.notifier,
                          )
                              .delete(log.id);

                          ref.invalidate(
                            paymentLogNotifierProvider,
                          );
                        },
                      ),
                    ),
                  )
                      .toList(),
                );
              },
              loading: () => const _LoadingCard(),
              error: (e, _) => _ErrorCard(
                message: 'Erreur paiements : $e',
              ),
            ),

            const Gap(28),

            // ───────────────────────────────────────────────────────────────
            // PREUVES
            // ───────────────────────────────────────────────────────────────

            const _SectionHeader(
              title: 'Preuves de livraison',
              icon: Iconsax.gallery,
              color: Colors.orange,
            ),

            const Gap(12),

            proofState.when(
              data: (paginated) {
                final filtered = paginated.results.where((proof) {
                  final matchesSearch =
                  proof.delivery.toString().contains(searchQuery);

                  final matchesDate =
                  _matchesDate(proof.uploadedAt);

                  return matchesSearch && matchesDate;
                }).toList();

                if (filtered.isEmpty) {
                  return const _EmptyState(
                    icon: Iconsax.gallery_slash,
                    message: 'Aucune preuve trouvée.',
                  );
                }

                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: filtered
                      .map(
                        (proof) => _ProofImage(
                      proof,
                      onDelete: () async {
                        await ref
                            .read(proofNotifierProvider.notifier)
                            .delete(proof.id);

                        ref.invalidate(
                          proofNotifierProvider,
                        );
                      },
                    ),
                  )
                      .toList(),
                );
              },
              loading: () => const _LoadingCard(),
              error: (e, _) => _ErrorCard(
                message: 'Erreur preuves : $e',
              ),
            ),

            const Gap(28),

            // ───────────────────────────────────────────────────────────────
            // LIVRAISONS
            // ───────────────────────────────────────────────────────────────

            const _SectionHeader(
              title: 'Suivi des livraisons',
              icon: Iconsax.truck,
              color: Colors.blue,
            ),

            const Gap(12),

            trackingState.when(
              data: (paginated) {
                final filtered = paginated.results.where((track) {
                  final matchesSearch =
                  track.status.toLowerCase().contains(searchQuery);

                  final matchesDate =
                  _matchesDate(track.updatedAt);

                  return matchesSearch && matchesDate;
                }).toList();

                if (filtered.isEmpty) {
                  return const _EmptyState(
                    icon: Iconsax.truck_fast,
                    message: 'Aucun suivi trouvé.',
                  );
                }

                return Column(
                  children: filtered
                      .map(
                        (track) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _TrackingInfoTile(
                        track,
                        onDelete: () async {
                          await ref
                              .read(
                            trackingInfoNotifierProvider.notifier,
                          )
                              .delete(track.id);

                          ref.invalidate(
                            trackingInfoNotifierProvider,
                          );
                        },
                      ),
                    ),
                  )
                      .toList(),
                );
              },
              loading: () => const _LoadingCard(),
              error: (e, _) => _ErrorCard(
                message: 'Erreur suivi : $e',
              ),
            ),

            const Gap(20),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// SECTION HEADER
// ═════════════════════════════════════════════════════════════════════════════

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _SectionHeader({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const Gap(12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// PAYMENT TILE
// ═════════════════════════════════════════════════════════════════════════════

class _PaymentLogTile extends StatelessWidget {
  final PaymentLog log;
  final VoidCallback? onDelete;

  const _PaymentLogTile(
      this.log, {
        this.onDelete,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Iconsax.card,
            color: Colors.green,
          ),
        ),
        title: Text(
          '${log.status} – ${log.amount}€',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            DateFormat('dd/MM/yyyy – HH:mm')
                .format(log.attemptTime),
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Iconsax.trash,
            color: Colors.redAccent,
            size: 20,
          ),
          onPressed: () => _showDeleteDialog(
            context,
            'Supprimer ce paiement ?',
            'Voulez-vous vraiment supprimer ce paiement ?',
            onDelete,
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// PROOF
// ═════════════════════════════════════════════════════════════════════════════

class _ProofImage extends StatelessWidget {
  final Proof proof;
  final VoidCallback? onDelete;

  const _ProofImage(
      this.proof, {
        this.onDelete,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: Image.network(
                  proof.image,
                  width: 150,
                  height: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 150,
                      height: 130,
                      color: Colors.grey.shade100,
                      child: const Icon(
                        Iconsax.gallery,
                        color: Colors.grey,
                        size: 32,
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  child: IconButton(
                    icon: const Icon(
                      Iconsax.trash,
                      color: Colors.redAccent,
                      size: 18,
                    ),
                    onPressed: () => _showDeleteDialog(
                      context,
                      'Supprimer cette preuve ?',
                      'Voulez-vous vraiment supprimer cette preuve ?',
                      onDelete,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              DateFormat('dd/MM/yyyy')
                  .format(proof.uploadedAt),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// TRACKING
// ═════════════════════════════════════════════════════════════════════════════

class _TrackingInfoTile extends StatelessWidget {
  final TrackingInfo trackingInfo;
  final VoidCallback? onDelete;

  const _TrackingInfoTile(
      this.trackingInfo, {
        this.onDelete,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Iconsax.truck,
            color: Colors.blue,
          ),
        ),
        title: Text(
          trackingInfo.status,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (trackingInfo.location != null)
                Text(
                  trackingInfo.location.toString(),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                ),
              Text(
                'Mis à jour le ${DateFormat('dd/MM/yyyy – HH:mm').format(trackingInfo.updatedAt)}',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Iconsax.trash,
            color: Colors.redAccent,
            size: 20,
          ),
          onPressed: () => _showDeleteDialog(
            context,
            'Supprimer ce suivi ?',
            'Voulez-vous vraiment supprimer ce tracking ?',
            onDelete,
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// EMPTY STATE
// ═════════════════════════════════════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  const _EmptyState({
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 38,
            color: Colors.grey.shade300,
          ),
          const Gap(10),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// LOADING
// ═════════════════════════════════════════════════════════════════════════════

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// ERROR
// ═════════════════════════════════════════════════════════════════════════════

class _ErrorCard extends StatelessWidget {
  final String message;

  const _ErrorCard({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Iconsax.warning_2,
            color: Colors.red,
          ),
          const Gap(10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// DELETE DIALOG
// ═════════════════════════════════════════════════════════════════════════════

Future<void> _showDeleteDialog(
    BuildContext context,
    String title,
    String message,
    VoidCallback? onDelete,
    ) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(message),
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

  if (confirmed == true) {
    onDelete?.call();
  }
}