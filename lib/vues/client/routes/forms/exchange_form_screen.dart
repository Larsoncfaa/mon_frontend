import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../fournisseurs/provider/exchange_request_provider.dart';
import '../../../../fournisseurs/provider/product_provider.dart';
import '../../../../fournisseurs/provider/refund_request_provider.dart';
import '../../../../models/exchange_request.dart';
import '../../../../models/product.dart';
import '../../../../models/refund_request.dart';

class ExchangeFormScreen extends ConsumerStatefulWidget {
  const ExchangeFormScreen({super.key});

  @override
  ConsumerState<ExchangeFormScreen> createState() => _ExchangeFormScreenState();
}

class _ExchangeFormScreenState extends ConsumerState<ExchangeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  RefundRequest? _selectedReturnRequest;
  Product? _selectedReplacement;
  bool _isSubmitting = false;

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: isError ? Colors.red : Colors.green),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(exchangeRequestNotifierProvider.notifier).create(
        ExchangeRequest(
          id: 0,
          returnRequest: _selectedReturnRequest!.id,
          replacement: _selectedReplacement!.id,
          exchangeStatus: null,
          reason: '',
          requestedProduct: '',
        ),
      );
      if (!mounted) return;
      _showSnackBar('Demande d’échange envoyée');
      Navigator.pop(context);
    } catch (e) {
      _showSnackBar('Erreur lors de l\'envoi', isError: true);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final refundState = ref.watch(refundRequestNotifierProvider);
    final productState = ref.watch(productNotifierProvider);

    final refundRequests = refundState.when(
      data: (list) => list,

      loading: () => [],
      error: (_, __) => [],
    );

    final products = productState.when(
      data: (list) => list.results ?? [],
      loading: () => [],
      error: (_, __) => [],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle Demande d’Échange')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<RefundRequest>(
                decoration: const InputDecoration(labelText: 'Demande de retour'),
                value: _selectedReturnRequest,
                items: refundRequests.map<DropdownMenuItem<RefundRequest>>((r) {
                  return DropdownMenuItem<RefundRequest>(
                    value: r,
                    child: Text('Retour #${r.id} – ${r.reason}'),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedReturnRequest = value),
                validator: (v) => v == null ? 'Sélectionnez une demande' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<Product>(
                decoration: const InputDecoration(labelText: 'Produit de remplacement'),
                value: _selectedReplacement,
                items: products.map<DropdownMenuItem<Product>>((p) {
                  return DropdownMenuItem<Product>(
                    value: p,
                    child: Text(p.name),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedReplacement = value),
                validator: (v) => v == null ? 'Sélectionnez un produit' : null,
              ),
              const SizedBox(height: 24),
              _isSubmitting
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
