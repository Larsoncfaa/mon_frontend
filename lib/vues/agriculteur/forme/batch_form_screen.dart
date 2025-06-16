// lib/ui/screens/batch_form_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // 1) Préremplissage du "Numéro de lot"
    _lotController = TextEditingController(
      text: widget.batch?.lotNumber ?? '',
    );

    // 2) Préremplissage de la date d'expiration au format "yyyy-MM-dd"
    if (widget.batch != null) {
      _expController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(
          widget.batch!.expirationDate.toLocal(),
        ),
      );
    } else {
      _expController = TextEditingController(text: '');
    }

    // 3) Valeur initiale du dropdown : l'ID du produit existant (si édition)
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
    setState(() => _isLoading = true);

    final expirationDate = DateTime.parse(_expController.text.trim());
    final notifier = ref.read(batchNotifierProvider.notifier);

    try {
      if (widget.batch == null) {
        // Création d'un nouvel objet Batch (id = 0 sera ignoré côté service)
        final newBatch = Batch(
          id: 0,
          product: _selectedProduct!,
          lotNumber: _lotController.text.trim(),
          expirationDate: expirationDate,
        );
        await notifier.createBatch(newBatch);
      } else {
        // Mise à jour du lot existant
        final updatedBatch = Batch(
          id: widget.batch!.id,
          product: _selectedProduct!,
          lotNumber: _lotController.text.trim(),
          expirationDate: expirationDate,
        );
        await notifier.updateBatch(widget.batch!.id, updatedBatch);
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (error) {
      if (mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erreur'),
            content: Text(
              error.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _pickDate() async {
    final initialDate = widget.batch?.expirationDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      locale: const Locale('fr'),
    );
    if (picked != null) {
      // On formate immédiatement en "yyyy-MM-dd"
      _expController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _confirmDelete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: const Text('Voulez-vous vraiment supprimer ce lot ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              'Supprimer',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      try {
        final notifier = ref.read(batchNotifierProvider.notifier);
        await notifier.deleteBatch(widget.batch!.id);
        if (mounted) Navigator.of(context).pop(true);
      } catch (error) {
        if (mounted) {
          await showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Erreur'),
              content: Text(
                error.toString(),
                style: const TextStyle(fontSize: 14),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.batch == null ? 'Créer un lot' : 'Modifier le lot'),
        actions: [
          if (widget.batch != null)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: _isLoading ? null : _confirmDelete,
              tooltip: 'Supprimer le lot',
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // --------------------
              // 1) Numéro de lot
              // --------------------
              TextFormField(
                controller: _lotController,
                decoration: const InputDecoration(labelText: 'Numéro de lot'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Champ requis';
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // ---------------------------------------------
              // 2) Dropdown pour sélectionner le PRODUIT
              //    → on affiche le `name` du produit, pas l’ID
              // ---------------------------------------------
              productsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Erreur produits : $e'),
                data: (paginatedProducts) {
                  return DropdownButtonFormField<int>(
                    value: _selectedProduct,
                    decoration: const InputDecoration(labelText: 'Produit'),
                    items: paginatedProducts.results
                        .map(
                          (p) => DropdownMenuItem<int>(
                        value: p.id,
                        child: Text(p.name),
                      ),
                    )
                        .toList(),
                    onChanged: (v) => setState(() => _selectedProduct = v),
                    validator: (v) {
                      if (v == null) return 'Sélection requise';
                      return null;
                    },
                  );
                },
              ),

              const SizedBox(height: 16),

              // ---------------------------------------------
              // 3) Champ Date d’expiration (lecture seule + date picker)
              // ---------------------------------------------
              TextFormField(
                controller: _expController,
                readOnly: true,
                onTap: _pickDate,
                decoration: const InputDecoration(
                  labelText: 'Date d\'expiration',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Champ requis';
                  // On impose le format EXACT : "YYYY-MM-DD"
                  final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                  if (!regex.hasMatch(v.trim())) {
                    return 'Format attendu : YYYY-MM-DD';
                  }
                  try {
                    DateTime.parse(v.trim());
                    return null;
                  } catch (_) {
                    return 'Date invalide';
                  }
                },
              ),

              const SizedBox(height: 24),

              // --------------------
              // 4) Bouton "Créer" ou "Enregistrer"
              // --------------------
              ElevatedButton(
                onPressed: _isLoading ? null : _save,
                child: _isLoading
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : Text(widget.batch == null ? 'Créer' : 'Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
