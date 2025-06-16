import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/stock_alert.dart';
import '../../../models/product.dart';
import '../../../models/warehouse.dart';
import '../../../fournisseurs/provider/product_provider.dart';
import '../../../fournisseurs/provider/warehouse_provider.dart';
import '../../../fournisseurs/provider/stock_alert_provider.dart';

class FormStockAlertScreen extends ConsumerStatefulWidget {
  const FormStockAlertScreen({super.key});

  @override
  ConsumerState<FormStockAlertScreen> createState() => _FormStockAlertScreenState();
}

class _FormStockAlertScreenState extends ConsumerState<FormStockAlertScreen> {
  final _formKey = GlobalKey<FormState>();
  final _thresholdController = TextEditingController();

  Product? _selectedProduct;
  Warehouse? _selectedWarehouse;
  bool _isActive = true;

  @override
  void dispose() {
    _thresholdController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() ||
        _selectedProduct == null ||
        _selectedWarehouse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    final alert = StockAlert(
      id: 0,
      product: _selectedProduct!,
      warehouse: _selectedWarehouse!,
      threshold: int.parse(_thresholdController.text.trim()),
      isActive: _isActive,
    );

    try {
      await ref.read(stockAlertNotifierProvider.notifier).createAlert(alert);
      if (context.mounted) Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la création : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productProvider);
    final warehouseAsync = ref.watch(warehouseNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Nouvelle alerte de stock")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Produit
              productAsync.when(
                data: (products) => DropdownButtonFormField<Product>(
                  value: _selectedProduct,
                  decoration: const InputDecoration(labelText: 'Produit'),
                  items: products.results.map((p) => DropdownMenuItem(
                    value: p,
                    child: Text(p.name),
                  )).toList(),
                  onChanged: (v) => setState(() => _selectedProduct = v),
                  validator: (v) => v == null ? 'Sélectionner un produit' : null,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Erreur produits : $e'),
              ),
              const SizedBox(height: 12),

              // Entrepôt
              warehouseAsync.when(
                data: (warehouses) => DropdownButtonFormField<Warehouse>(
                  value: _selectedWarehouse,
                  decoration: const InputDecoration(labelText: 'Entrepôt'),
                  items: warehouses.results.map((w) => DropdownMenuItem(
                    value: w,
                    child: Text(w.name),
                  )).toList(),
                  onChanged: (v) => setState(() => _selectedWarehouse = v),
                  validator: (v) => v == null ? 'Sélectionner un entrepôt' : null,
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Erreur entrepôts : $e'),
              ),
              const SizedBox(height: 12),

              // Seuil
              TextFormField(
                controller: _thresholdController,
                decoration: const InputDecoration(labelText: 'Seuil'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Entrer un seuil' : null,
              ),
              const SizedBox(height: 12),

              // Actif
              SwitchListTile(
                title: const Text("Actif"),
                value: _isActive,
                onChanged: (v) => setState(() => _isActive = v),
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Créer l'alerte"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
