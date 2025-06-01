import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/batch_provider.dart';
import '../../../fournisseurs/provider/product_provider.dart';
import '../../../models/batch.dart';


class BatchFormScreen extends ConsumerStatefulWidget {
  final Batch? batch;
  const BatchFormScreen({super.key, this.batch});

  @override
  ConsumerState<BatchFormScreen> createState() => _BatchFormScreenState();
}

class _BatchFormScreenState extends ConsumerState<BatchFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _lotController;
  late TextEditingController _expController;
  int? _selectedProduct;

  @override
  void initState() {
    super.initState();
    _lotController = TextEditingController(text: widget.batch?.lotNumber ?? '');
    _expController = TextEditingController(
        text: widget.batch != null
            ? widget.batch!.expirationDate.toLocal().toIso8601String().split('T').first
            : '');
    _selectedProduct = widget.batch?.product;
  }

  @override
  void dispose() {
    _lotController.dispose();
    _expController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final notifier = ref.read(batchNotifierProvider.notifier);
    final newBatch = Batch(
      id: widget.batch?.id ?? 0,
      product: _selectedProduct!,
      lotNumber: _lotController.text.trim(),
      expirationDate: DateTime.parse(_expController.text.trim()),
    );
    if (widget.batch == null) {
      await notifier.createBatch(newBatch);
    } else {
      await notifier.updateBatch(widget.batch!.id, newBatch);
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.batch == null ? 'Créer un lot' : 'Modifier le lot'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextFormField(
                controller: _lotController,
                decoration: const InputDecoration(labelText: 'Numéro de lot'),
                validator: (v) => v == null || v.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 16),
              productsAsync.when(
                data: (products) => DropdownButtonFormField<int>(
                  value: _selectedProduct,
                  decoration: const InputDecoration(labelText: 'Produit'),
                  items: products.map((p) => DropdownMenuItem(
                    value: p.id,
                    child: Text(p.name),
                  )).toList(),
                  onChanged: (v) => setState(() => _selectedProduct = v),
                  validator: (v) => v == null ? 'Sélection requise' : null,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Erreur produits: $e'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _expController,
                decoration: const InputDecoration(labelText: 'Date expiration (YYYY-MM-DD)'),
                validator: (v) {
                  try {
                    DateTime.parse(v!);
                    return null;
                  } catch (_) {
                    return 'Date invalide';
                  }
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _save,
                child: Text(widget.batch == null ? 'Créer' : 'Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
