import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/stock_movement_provider.dart';
import '../../../fournisseurs/provider/product_provider.dart';
import '../../../fournisseurs/provider/warehouse_provider.dart';
import '../../../fournisseurs/provider/batch_provider.dart'; // <-- Ajouté

import '../../../models/stock_movement.dart';
import '../../../models/product.dart';
import '../../../models/warehouse.dart';
import '../../../models/batch.dart'; // <-- Ajouté

class AjouterStockMovementScreen extends ConsumerStatefulWidget {
  const AjouterStockMovementScreen({super.key});

  @override
  ConsumerState<AjouterStockMovementScreen> createState() =>
      _AjouterStockMovementScreenState();
}

class _AjouterStockMovementScreenState
    extends ConsumerState<AjouterStockMovementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();

  MovementTypeEnum? _selectedMovementType;
  Product? _selectedProduct;
  Warehouse? _selectedWarehouse;
  Batch? _selectedBatch; // <-- Ajouté

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() ||
        _selectedProduct == null ||
        _selectedWarehouse == null ||
        _selectedMovementType == null ||
        _selectedBatch == null) { // <-- Ajouté
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

    final newMovement = StockMovement(
      id: 0,
      product: _selectedProduct!.id,
      warehouse: _selectedWarehouse!.id!,
      batch: _selectedBatch!.id, // <-- Ajouté
      movementType: _selectedMovementType!,
      quantity: quantity,
      timestamp: DateTime.now(),
      user: null,
    );

    final repository = ref.read(stockMovementRepositoryProvider);
    try {
      final createdMovement =
      await repository.createStockMovement(newMovement);

      if (createdMovement.id != 0) {
        ref.invalidate(stockMovementServiceProvider);
        Navigator.pushReplacementNamed(context, '/stock');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Impossible de créer le mouvement')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l’ajout : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productProvider);
    final warehouseAsync = ref.watch(warehouseListProvider);
    final batchAsync = ref.watch(batchProvider); // <-- Ajouté

    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un mouvement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: productAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Erreur produits : $e')),
          data: (products) {
            return warehouseAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Erreur entrepôts : $e')),
              data: (warehouses) {
                return batchAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Erreur lots : $e')),
                  data: (batches) {
                    return Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          // Produit
                          DropdownButtonFormField<Product>(
                            value: _selectedProduct,
                            decoration:
                            const InputDecoration(labelText: 'Produit'),
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
                            validator: (value) =>
                            value == null ? 'Requis' : null,
                          ),
                          const SizedBox(height: 12),

                          // Entrepôt
                          DropdownButtonFormField<Warehouse>(
                            value: _selectedWarehouse,
                            decoration:
                            const InputDecoration(labelText: 'Entrepôt'),
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
                            validator: (value) =>
                            value == null ? 'Requis' : null,
                          ),
                          const SizedBox(height: 12),

                          // Lot (Batch)
                          DropdownButtonFormField<Batch>(
                            value: _selectedBatch,
                            decoration:
                            const InputDecoration(labelText: 'Lot'),
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
                            validator: (value) =>
                            value == null ? 'Requis' : null,
                          ),
                          const SizedBox(height: 12),

                          // Quantité
                          TextFormField(
                            controller: _quantityController,
                            decoration: InputDecoration(
                              labelText:
                              'Quantité ${_selectedProduct != null ? '(${_selectedProduct!.unit.label})' : ''}',
                            ),
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

                          // Type de mouvement
                          DropdownButtonFormField<MovementTypeEnum>(
                            value: _selectedMovementType,
                            decoration: const InputDecoration(
                                labelText: 'Type de mouvement'),
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
                            validator: (value) =>
                            value == null ? 'Requis' : null,
                          ),
                          const SizedBox(height: 24),

                          // Bouton
                          ElevatedButton(
                            onPressed: _submit,
                            child: const Text('Valider'),
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
