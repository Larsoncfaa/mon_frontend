import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/category_provider.dart';
import '../../../models/product.dart';
import '../../../models/category.dart';
 // adapte ce chemin si besoin

/// Formulaire Add/Edit pour un Product.
/// Appelle onSubmit avec le Product complété.
class ProductForm extends ConsumerStatefulWidget {
  final Product? product;
  final Future<void> Function(Product) onSubmit;

  const ProductForm({
    super.key,
    this.product,
    required this.onSubmit,
  });

  @override
  ConsumerState<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _stockCtrl;
  late UnitEnum _unit;
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _nameCtrl = TextEditingController(text: p?.name ?? '');
    _priceCtrl = TextEditingController(text: p?.sellingPrice.toString() ?? '');
    _stockCtrl = TextEditingController(text: p?.quantityInStock?.toString() ?? '');
    _unit = p?.unit ?? UnitEnum.kg;
    if (p?.category != null) {
      _selectedCategory = Category(id: 0, name: p!.category); // Remplace "0" si tu as l’ID exact
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _stockCtrl.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final newProduct = Product(
        id: widget.product?.id ?? 0,
        category: _selectedCategory?.name ?? '', // ou .id selon ton backend
        image: widget.product?.image,
        name: _nameCtrl.text.trim(),
        description: widget.product?.description,
        quantityInStock: int.tryParse(_stockCtrl.text.trim()),
        unit: _unit,
        purchasePrice: widget.product?.purchasePrice ?? 0,
        sellingPrice: double.parse(_priceCtrl.text.trim()),
        expirationDate: widget.product?.expirationDate,
        qrCodeImage: widget.product?.qrCodeImage,
      );
      widget.onSubmit(newProduct);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryAsync = ref.watch(categoryNotifierProvider);

    return AlertDialog(
      title: Text(widget.product == null ? 'Ajouter un produit' : 'Modifier le produit'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (v) => v == null || v.isEmpty ? 'Nom requis' : null,
              ),
              TextFormField(
                controller: _priceCtrl,
                decoration: const InputDecoration(labelText: 'Prix de vente'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || double.tryParse(v) == null ? 'Prix invalide' : null,
              ),
              TextFormField(
                controller: _stockCtrl,
                decoration: const InputDecoration(labelText: 'Quantité en stock'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),

              // Dropdown pour la catégorie
              categoryAsync.when(
                data: (categories) => DropdownButtonFormField<Category>(
                  value: _selectedCategory != null
                      ? categories.firstWhere(
                        (c) => c.name == _selectedCategory!.name,
                    orElse: () => categories.first,
                  )
                      : null,
                  items: categories.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(cat.name),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _selectedCategory = val),
                  decoration: const InputDecoration(labelText: 'Catégorie'),
                  validator: (val) => val == null ? 'Veuillez choisir une catégorie' : null,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (err, _) => Text('Erreur de chargement des catégories : $err'),
              ),

              const SizedBox(height: 12),
              DropdownButtonFormField<UnitEnum>(
                value: _unit,
                decoration: const InputDecoration(labelText: 'Unité'),
                items: UnitEnum.values.map((u) {
                  return DropdownMenuItem(
                    value: u,
                    child: Text(u.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (u) => setState(() => _unit = u!),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Annuler')),
        ElevatedButton(onPressed: _handleSubmit, child: const Text('Enregistrer')),
      ],
    );
  }
}
