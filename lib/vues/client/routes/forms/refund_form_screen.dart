import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/provider/refund_request_provider.dart';
import '../../../../models/refund_request.dart';
import '../../../../models/refund_status_enum.dart';


class RefundFormScreen extends ConsumerStatefulWidget {
  const RefundFormScreen({super.key});

  @override
  ConsumerState<RefundFormScreen> createState() => _RefundFormScreenState();
}

class _RefundFormScreenState extends ConsumerState<RefundFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _orderId;
  String? _reason;
  String? _evidence;
  RefundStatusEnum _status = RefundStatusEnum.PENDING;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle Demande de Remboursement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'ID commande'),
              keyboardType: TextInputType.number,
              onSaved: (v) => _orderId = int.tryParse(v ?? ''),
              validator: (v) => (v == null || int.tryParse(v) == null) ? 'Requis' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Raison'),
              onSaved: (v) => _reason = v,
              validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Preuves'),
              onSaved: (v) => _evidence = v,
              validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<RefundStatusEnum>(
              decoration: const InputDecoration(labelText: 'Statut'),
              value: _status,
              items: RefundStatusEnum.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: (v) => setState(() => _status = v!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Envoyer'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ref.read(refundRequestNotifierProvider.notifier).create(RefundRequest(
                    id: 0,
                    daysRemaining: 0,
                    reason: _reason!,
                    evidence: _evidence!,
                    refundStatus: _status,
                    requestedAt: DateTime.now(),
                    processedAt: null,
                    order: _orderId!,
                  ));
                  Navigator.pop(context);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
