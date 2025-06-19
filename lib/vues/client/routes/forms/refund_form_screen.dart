import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/provider/order_provider.dart';
import '../../../../fournisseurs/provider/refund_request_provider.dart';
import '../../../../models/order.dart';
import '../../../../models/order_status_enum.dart';
import '../../../../models/refund_request.dart';

class RefundFormScreen extends ConsumerStatefulWidget {
  const RefundFormScreen({super.key});

  @override
  ConsumerState<RefundFormScreen> createState() => _RefundFormScreenState();
}

// ✅ Nom corrigé ici
class _RefundFormScreenState extends ConsumerState<RefundFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Order? _selectedOrder;
  String? _reason;
  File? _evidence;
  bool _isSubmitting = false;

  void _showSnackBar(String message, {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _pickEvidenceFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() => _evidence = File(result.files.single.path!));
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (_evidence == null) {
      _showSnackBar('Veuillez joindre une pièce justificative.', isError: true);
      return;
    }

    _formKey.currentState!.save();
    setState(() => _isSubmitting = true);

    try {
      final refundRequest = RefundRequest(
        id: 0,
        reason: _reason!,
        evidence: _evidence,
        refundStatus: null,
        requestedAt: null,
        processedAt: null,
        order: _selectedOrder!.id,
        daysRemaining: 7,
      );

      await ref.read(refundRequestNotifierProvider.notifier).create(refundRequest);

      if (!mounted) return;
      _showSnackBar('Demande de remboursement envoyée');
      Navigator.pop(context);
    } catch (e) {
      _showSnackBar('Erreur lors de l\'envoi', isError: true);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderNotifierProvider);
    final now = DateTime.now();

    final eligibleOrders = orderState.when(
      data: (orderList) => orderList.results?.where((order) {
        final delivered = order.orderStatus == OrderStatusEnum.delivered;
        final paid = true; // Tu peux remplacer par un vrai champ si disponible
        final within14Days = now.difference(order.dateOrdered).inDays <= 14;
        return delivered && paid && within14Days;
      }).toList() ?? [],
      loading: () => [],
      error: (_, __) => [],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle Demande de Remboursement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<Order>(
                decoration: const InputDecoration(labelText: 'Commande'),
                value: _selectedOrder,
                items: eligibleOrders.map<DropdownMenuItem<Order>>((order) {
                  return DropdownMenuItem<Order>(
                    value: order,
                    child: Text('Commande #${order.id} – ${order.dateOrdered.toLocal()}'),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedOrder = value),
                validator: (value) => value == null ? 'Sélectionnez une commande' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Motif'),
                onSaved: (v) => _reason = v,
                validator: (v) => (v == null || v.isEmpty) ? 'Motif requis' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _pickEvidenceFile,
                icon: const Icon(Icons.upload_file),
                label: Text(_evidence == null ? 'Joindre une preuve' : 'Fichier sélectionné'),
              ),
              const SizedBox(height: 24),
              _isSubmitting
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Envoyer'),
              ),
              const SizedBox(height: 12),
              if (eligibleOrders.isEmpty)
                const Text(
                  'Aucune commande éligible au remboursement.',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
