import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../fournisseurs/provider/category_provider.dart';
import '../../../fournisseurs/provider/product_provider.dart';
import '../../../models/product.dart';
import '../../../models/category.dart';
import 'category_form_screen.dart'; // Assurez-vous que le ProductNotifier est importé.

class ProductForm extends ConsumerStatefulWidget {
  final Product? product;
  final Future<void> Function(Product, File?) onSubmit;

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
  late TextEditingController _descriptionCtrl;
  late TextEditingController _expirationDateCtrl;

  late UnitEnum _unit;
  Category? _selectedCategory;

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  DateTime? _selectedExpirationDate;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _nameCtrl = TextEditingController(text: p?.name ?? '');
    _priceCtrl = TextEditingController(text: p?.sellingPrice.toString() ?? '');
    _descriptionCtrl = TextEditingController(text: p?.description ?? '');
    _expirationDateCtrl = TextEditingController(
      text: p?.expirationDate != null ? _formatDate(p!.expirationDate!) : '',
    );
    _unit = p?.unit ?? UnitEnum.kg;
    if (p?.category != null) {
      _selectedCategory = Category(id: 0, name: p!.category);
    }
    if (p?.image != null && p!.image!.isNotEmpty) {
      _imageFile = null;
    }
    _selectedExpirationDate = p?.expirationDate;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _descriptionCtrl.dispose();
    _expirationDateCtrl.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickExpirationDate() async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedExpirationDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      setState(() {
        _selectedExpirationDate = picked;
        _expirationDateCtrl.text = _formatDate(picked);
      });
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    // Vérification si le produit existe déjà
    final productExists = await ref.read(productNotifierProvider.notifier).checkProductExists(
      _nameCtrl.text.trim(),
      _selectedCategory?.name ?? '',
    );

    if (productExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ce produit existe déjà dans cette catégorie')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final newProduct = Product(
      id: widget.product?.id ?? 0,
      category: _selectedCategory?.name ?? '',
      image: _imageFile != null ? _imageFile!.path : widget.product?.image,
      name: _nameCtrl.text.trim(),
      description: _descriptionCtrl.text.trim(),
      quantityInStock: null, // supprimé, mais toujours dans le constructeur pour compatibilité
      unit: _unit,
      purchasePrice: widget.product?.purchasePrice ?? 0,
      sellingPrice: double.tryParse(_priceCtrl.text.trim()) ?? 0.0,
      expirationDate: null,
      qrCodeImage: widget.product?.qrCodeImage,
    );

    final productJson = newProduct.toJson();
    if (_selectedExpirationDate != null) {
      productJson['expiration_date'] = _formatDate(_selectedExpirationDate!);
    }

    try {
      await widget.onSubmit(newProduct, _imageFile);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de l\'enregistrement : $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
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
                controller: _descriptionCtrl,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Image du produit'),
                  const SizedBox(height: 8),
                  if (_imageFile != null)
                    Image.file(_imageFile!, width: 100, height: 100, fit: BoxFit.cover)
                  else if (widget.product?.image != null && widget.product!.image!.isNotEmpty)
                    Image.network(widget.product!.image!, width: 100, height: 100, fit: BoxFit.cover)
                  else
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
                  TextButton.icon(
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Choisir une image'),
                    onPressed: _pickImage,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _expirationDateCtrl,
                decoration: const InputDecoration(
                  labelText: 'Date d\'expiration',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: _pickExpirationDate,
              ),
              const SizedBox(height: 12),
              categoryAsync.when(
                data: (categories) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<Category>(
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
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.green),
                        tooltip: 'Ajouter une nouvelle catégorie',
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (_) => const CategoryManagementScreen(),
                          ))
                              .then((_) {
                            ref.read(categoryNotifierProvider.notifier).loadCategories();
                          });
                        },
                      ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
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
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _handleSubmit,
          child: _isSubmitting
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          )
              : const Text('Enregistrer'),
        ),
      ],
    );
  }
}
