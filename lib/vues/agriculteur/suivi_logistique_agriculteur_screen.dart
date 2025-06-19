import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import '../../fournisseurs/provider/payment_log_provider.dart';
import '../../fournisseurs/provider/proof_provider.dart';
import '../../fournisseurs/provider/tracking_info_provider.dart';
import '../../models/payment_log.dart';
import '../../models/proof.dart';
import '../../models/tracking_info.dart';
import '../../widgets/app_drawer.dart';


class SuiviLogistiqueAgriculteurScreen extends ConsumerWidget {
  const SuiviLogistiqueAgriculteurScreen({super.key});

  Future<void> _exportCsv(BuildContext context,
      List<PaymentLog> payments,
      List<Proof> proofs,
      List<TrackingInfo> trackings) async {
    final buffer = StringBuffer();
    buffer.writeln('Paiements');
    buffer.writeln('Statut,Montant,Date');
    for (final p in payments) {
      buffer.writeln(
          '${p.paymentStatus},${p.amount},${DateFormat('yyyy-MM-dd').format(p.attemptTime)}');
    }
    buffer.writeln();
    buffer.writeln('Preuves');
    buffer.writeln('ID,Lien,Date');
    for (final pr in proofs) {
      buffer.writeln(
          '${pr.id},${pr.image},${DateFormat('yyyy-MM-dd').format(pr.uploadedAt)}');
    }
    buffer.writeln();
    buffer.writeln('Suivi');
    buffer.writeln('Statut,Localisation,Date');
    for (final t in trackings) {
      buffer.writeln(
          '${t.trackingStatus},${t.location},${DateFormat('yyyy-MM-dd').format(t.timestamp)}');
    }

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/suivi_logistique.csv');
    await file.writeAsString(buffer.toString());
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('CSV enregistré : ${file.path}')),
      );
    }
  }

  Future<void> _exportPdf(BuildContext context,
      List<PaymentLog> payments,
      List<Proof> proofs,
      List<TrackingInfo> trackings) async {
    final buffer = StringBuffer();
    buffer.writeln('Suivi logistique');
    buffer.writeln();
    buffer.writeln('Paiements');
    for (final p in payments) {
      buffer.writeln(
          '- ${p.paymentStatus} : ${p.amount}€ (${DateFormat('yyyy-MM-dd').format(p.attemptTime)})');
    }
    buffer.writeln();
    buffer.writeln('Preuves');
    for (final pr in proofs) {
      buffer.writeln(
          '- ${pr.image} (${DateFormat('yyyy-MM-dd').format(pr.uploadedAt)})');
    }
    buffer.writeln();
    buffer.writeln('Suivi');
    for (final t in trackings) {
      buffer.writeln(
          '- ${t.trackingStatus} @${t.location} (${DateFormat('yyyy-MM-dd').format(t.timestamp)})');
    }

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/suivi_logistique.pdf');
    await file.writeAsString(buffer.toString());
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF enregistré : ${file.path}')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentLogState = ref.watch(paymentLogNotifierProvider);
    final proofState = ref.watch(proofNotifierProvider);
    final trackingState = ref.watch(trackingInfoNotifierProvider);

    String searchQuery = '';
    DateTime? selectedDate;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Suivi logistique"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              final payments =
                  paymentLogState.value?.results ?? <PaymentLog>[];
              final proofs = proofState.value?.results ?? <Proof>[];
              final trackings =
                  trackingState.value?.results ?? <TrackingInfo>[];

              if (value == 'pdf') {
                await _exportPdf(context, payments, proofs, trackings);
              } else if (value == 'csv') {
                await _exportCsv(context, payments, proofs, trackings);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'pdf', child: Text('Exporter en PDF')),
              PopupMenuItem(value: 'csv', child: Text('Exporter en CSV')),
            ],
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Rechercher'),
              onChanged: (value) {
                searchQuery = value.toLowerCase();
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
              child: const Text("Filtrer par date"),
            ),
            const SizedBox(height: 20),
            const Text("Paiements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            paymentLogState.when(
              data: (paginated) {
                final filtered = paginated.results.where((log) {
                  final matchesSearch = log.paymentStatus.toLowerCase().contains(searchQuery);
                  final matchesDate = selectedDate == null ||
                      DateUtils.isSameDay(log.attemptTime, selectedDate);
                  return matchesSearch && matchesDate;
                }).toList();

                return Column(
                  children: filtered
                      .map((log) => _PaymentLogTile(
                    log,
                    onDelete: () async {
                      await ref.read(paymentLogNotifierProvider.notifier).delete(log.id);
                      ref.invalidate(paymentLogNotifierProvider);
                    },
                  ))
                      .toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text("Erreur : $e"),
            ),
            const Divider(),
            const Text("Preuves", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            proofState.when(
              data: (paginated) {
                final filtered = paginated.results.where((proof) {
                  final matchesSearch = proof.delivery.toString().contains(searchQuery);
                  final matchesDate = selectedDate == null ||
                      DateUtils.isSameDay(proof.uploadedAt, selectedDate);
                  return matchesSearch && matchesDate;
                }).toList();

                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: filtered
                      .map((proof) => _ProofImage(
                    proof,
                    onDelete: () async {
                      await ref.read(proofNotifierProvider.notifier).delete(proof.id);
                      ref.invalidate(proofNotifierProvider);
                    },
                  ))
                      .toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text("Erreur : $e"),
            ),
            const Divider(),
            const Text("Livraison", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            trackingState.when(
              data: (paginated) {
                final filtered = paginated.results.where((track) {
                  final matchesSearch = track.trackingStatus.toLowerCase().contains(searchQuery);
                  final matchesDate = selectedDate == null ||
                      DateUtils.isSameDay(track.timestamp, selectedDate);
                  return matchesSearch && matchesDate;
                }).toList();

                return Column(
                  children: filtered
                      .map((track) => _TrackingInfoTile(
                    track,
                    onDelete: () async {
                      await ref.read(trackingInfoNotifierProvider.notifier).delete(track.id);
                      ref.invalidate(trackingInfoNotifierProvider);
                    },
                  ))
                      .toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text("Erreur : $e"),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentLogTile extends StatelessWidget {
  final PaymentLog log;
  final VoidCallback? onDelete;

  const _PaymentLogTile(this.log, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${log.paymentStatus} – ${log.amount}€"),
      subtitle: Text("Le ${DateFormat('yyyy-MM-dd – HH:mm').format(log.attemptTime)}"),
      leading: const Icon(Icons.payment),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Confirmer la suppression"),
              content: const Text("Voulez-vous vraiment supprimer ce paiement ?"),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onDelete != null) onDelete!();
                  },
                  child: const Text("Supprimer", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProofImage extends StatelessWidget {
  final Proof proof;
  final VoidCallback? onDelete;

  const _ProofImage(this.proof, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image.network(proof.image, width: 100, height: 100),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Confirmer la suppression"),
                content: const Text("Voulez-vous vraiment supprimer cette preuve ?"),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onDelete != null) onDelete!();
                    },
                    child: const Text("Supprimer", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _TrackingInfoTile extends StatelessWidget {
  final TrackingInfo trackingInfo;
  final VoidCallback? onDelete;

  const _TrackingInfoTile(this.trackingInfo, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trackingInfo.trackingStatus),
      subtitle: Text("Mis à jour le ${DateFormat('yyyy-MM-dd – HH:mm').format(trackingInfo.timestamp)}"),
      leading: const Icon(Icons.local_shipping),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Confirmer la suppression"),
              content: const Text("Voulez-vous vraiment supprimer ce tracking ?"),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onDelete != null) onDelete!();
                  },
                  child: const Text("Supprimer", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
