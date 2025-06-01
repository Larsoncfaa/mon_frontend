import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/provider/exchange_request_provider.dart';
import '../../../../models/exchange_request.dart';


class ExchangeFormScreen extends ConsumerStatefulWidget {
  const ExchangeFormScreen({super.key});

  @override
  ConsumerState<ExchangeFormScreen> createState() => _ExchangeFormScreenState();
}

class _ExchangeFormScreenState extends ConsumerState<ExchangeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _returnRequest;
  int? _replacement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle Demande d’Échange')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'ID demande de retour'),
                keyboardType: TextInputType.number,
                onSaved: (v) => _returnRequest = int.tryParse(v ?? ''),
                validator: (v) => (v == null || int.tryParse(v) == null) ? 'Requis' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'ID remplacement'),
                keyboardType: TextInputType.number,
                onSaved: (v) => _replacement = int.tryParse(v ?? ''),
                validator: (v) => (v == null || int.tryParse(v) == null) ? 'Requis' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Envoyer'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final notifier = ref.read(exchangeRequestNotifierProvider.notifier);
                    notifier.create(ExchangeRequest(
                      id: 0,
                      returnRequest: _returnRequest!,
                      replacement: _replacement!,
                      exchangeStatus: null,
                    ));
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
