import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/product_provider.dart';
import '../../../fournisseurs/provider/selection_provider.dart';
import '../../../models/product.dart';
import '../../../models/selection.dart';
import '../../../widgets/snackbar.dart';


class SelectionFormPage extends ConsumerStatefulWidget {
  final Selection? selection;
  const SelectionFormPage({Key? key, this.selection}) : super(key: key);

  @override
  ConsumerState<SelectionFormPage> createState() => _SelectionFormPageState();
}

class _SelectionFormPageState extends ConsumerState<SelectionFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _quantityCtrl;
  Product? _selectedProduct;

  @override
  void initState() {
    super.initState();
    _quantityCtrl = TextEditingController(
      text: widget.selection?.quantity.toString() ?? '',
    );
    if (widget.selection != null) {
      // Init selectedProduct from existing selection
      final paginated = ref.read(productProvider).value;
      if (paginated != null) {
        _selectedProduct = paginated.results
            .firstWhere((p) => p.id == widget.selection!.product, orElse: () => paginated.results.first);
      }
    }
  }

  @override
  void dispose() {
    _quantityCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate() || _selectedProduct == null) return;

    final qty = int.parse(_quantityCtrl.text.trim());
    final notifier = ref.read(selectionNotifierProvider.notifier);

    try {
      if (widget.selection == null) {
        final newSel = Selection(
          id: 0,
          product: _selectedProduct!.id,
          image: _selectedProduct!.image,
          quantity: qty,
          name: _selectedProduct!.name,
          sellingPrice: _selectedProduct!.sellingPrice.toString(),
          description: _selectedProduct!.description,
          expirationDate: _selectedProduct!.expirationDate,
          category: _selectedProduct!.category,
          createdAt: DateTime.now(),
        );
        await notifier.addSelection(newSel);
        showSnackBar(context, 'Produit ajouté avec succès');
      } else {
        final updatedSel = widget.selection!.copyWith(quantity: qty);
        await notifier.updateSelection(widget.selection!.id, updatedSel);
        showSnackBar(context, 'Sélection mise à jour');
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      showSnackBar(context, 'Erreur : $e', isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selection == null ? 'Ajouter une sélection' : 'Modifier la sélection'),
      ),
      body: productsAsync.when(
        data: (paginated) {
          final products = paginated.results;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<Product>(
                    value: _selectedProduct,
                    decoration: const InputDecoration(labelText: 'Produit'),
                    items: products.map((p) {
                      return DropdownMenuItem(value: p, child: Text(p.name));
                    }).toList(),
                    onChanged: (p) => setState(() => _selectedProduct = p),
                    validator: (v) => v == null ? 'Produit requis' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _quantityCtrl,
                    decoration: const InputDecoration(labelText: 'Quantité'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                    v == null || int.tryParse(v) == null ? 'Quantité invalide' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _save,
                    child: Text(widget.selection == null ? 'Ajouter' : 'Modifier'),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
    );
  }
}
