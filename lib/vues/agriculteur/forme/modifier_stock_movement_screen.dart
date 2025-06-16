import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/stock_movement_provider.dart';
import '../../../fournisseurs/provider/product_provider.dart';
import '../../../fournisseurs/provider/warehouse_provider.dart';
import '../../../fournisseurs/provider/batch_provider.dart';

import '../../../models/stock_movement.dart';
import '../../../models/product.dart';
import '../../../models/warehouse.dart';
import '../../../models/batch.dart';

class ModifierStockMovementScreen extends ConsumerStatefulWidget {
  final StockMovement mouvement;

  const ModifierStockMovementScreen({super.key, required this.mouvement});

  @override
  ConsumerState<ModifierStockMovementScreen> createState() =>
      _ModifierStockMovementScreenState();
}

class _ModifierStockMovementScreenState
    extends ConsumerState<ModifierStockMovementScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _quantityController;

  MovementTypeEnum? _selectedMovementType;
  Product? _selectedProduct;
  Warehouse? _selectedWarehouse;
  Batch? _selectedBatch;

  @override
  void initState() {
    super.initState();
    _quantityController =
        TextEditingController(text: widget.mouvement.quantity.toString());
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() ||
        _selectedProduct == null ||
        _selectedWarehouse == null ||
        _selectedBatch == null ||
        _selectedMovementType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    final quantity = int.tryParse(_quantityController.text.trim());
    if (quantity == null || quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quantité invalide')),
      );
      return;
    }

    final updatedMovement = widget.mouvement.copyWith(
      product: _selectedProduct!.id,
      warehouse: _selectedWarehouse!.id!,
      batch: _selectedBatch!.id,
      quantity: quantity,
      movementType: _selectedMovementType!,
    );

    final notifier = ref.read(stockMovementNotifierProvider.notifier);
    try {
      await notifier.updateStockMovement(updatedMovement);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productProvider);
    final warehouseAsync = ref.watch(warehouseListProvider);
    final batchAsync = ref.watch(batchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Modifier le mouvement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: productAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Erreur produits : $e')),
          data: (products) {
            _selectedProduct ??= products.results.firstWhere(
                  (p) => p.id == widget.mouvement.product,
              orElse: () => products.results.first,
            );
            return warehouseAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Erreur entrepôts : $e')),
              data: (warehouses) {
                _selectedWarehouse ??= warehouses.firstWhere(
                      (w) => w.id == widget.mouvement.warehouse,
                  orElse: () => warehouses.first,
                );
                return batchAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Erreur lots : $e')),
                  data: (batches) {
                    _selectedBatch ??= batches.firstWhere(
                          (b) => b.id == widget.mouvement.batch,
                      orElse: () => batches.first,
                    );
                    _selectedMovementType ??= widget.mouvement.movementType;

                    return Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          DropdownButtonFormField<Product>(
                            value: _selectedProduct,
                            decoration: const InputDecoration(labelText: 'Produit'),
                            items: products.results.map((product) {
                              return DropdownMenuItem(
                                value: product,
                                child: Text(product.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedProduct = value;
                              });
                            },
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<Warehouse>(
                            value: _selectedWarehouse,
                            decoration: const InputDecoration(labelText: 'Entrepôt'),
                            items: warehouses.map((warehouse) {
                              return DropdownMenuItem(
                                value: warehouse,
                                child: Text(warehouse.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedWarehouse = value;
                              });
                            },
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<Batch>(
                            value: _selectedBatch,
                            decoration: const InputDecoration(labelText: 'Lot'),
                            items: batches.map((batch) {
                              return DropdownMenuItem(
                                value: batch,
                                child: Text(batch.lotNumber),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedBatch = value;
                              });
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _quantityController,
                            decoration: const InputDecoration(labelText: 'Quantité'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Quantité requise';
                              }
                              final q = int.tryParse(value.trim());
                              if (q == null || q <= 0) {
                                return 'Doit être un entier > 0';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<MovementTypeEnum>(
                            value: _selectedMovementType,
                            decoration: const InputDecoration(labelText: 'Type de mouvement'),
                            items: MovementTypeEnum.values.map((type) {
                              return DropdownMenuItem(
                                value: type,
                                child: Text(
                                  switch (type) {
                                    MovementTypeEnum.in_ => 'IN (Entrée)',
                                    MovementTypeEnum.out => 'OUT (Sortie)',
                                    MovementTypeEnum.adj => 'ADJ (Ajustement)',
                                  },
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedMovementType = value;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: _submit,
                            child: const Text('Enregistrer'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
