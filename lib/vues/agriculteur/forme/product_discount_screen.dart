import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/product_discount_provider.dart';
import '../../../fournisseurs/provider/product_provider.dart';
import '../../../models/product_discount.dart';
import '../../../widgets/error_widget.dart';
import '../../../widgets/loading_widget.dart';

class ProductDiscountScreen extends ConsumerStatefulWidget {
  const ProductDiscountScreen({super.key});

  @override
  ConsumerState<ProductDiscountScreen> createState() => _ProductDiscountScreenState();
}

class _ProductDiscountScreenState extends ConsumerState<ProductDiscountScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  Map<int, String> _productNames = {};

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(productDiscountNotifierProvider.notifier).load(page: _currentPage);

      final productsState = ref.read(productProvider);
      productsState.whenData((paginated) {
        setState(() {
          _productNames = {
            for (var p in paginated.results) p.id: p.name,
          };
        });
      });
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final state = ref.read(productDiscountNotifierProvider);
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        state is AsyncData) {
      final paginated = state.value!;
      if (paginated.next != null) {
        _currentPage++;
        ref.read(productDiscountNotifierProvider.notifier).load(page: _currentPage);
      }
    }
  }

  Future<void> _showForm({ProductDiscount? existing}) async {
    final percentController = TextEditingController(
      text: existing != null ? existing.discountPercent.toString() : '',
    );
    int? selectedProductId = existing?.product;

    final productsState = ref.read(productProvider);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(existing == null ? 'Nouvelle remise produit' : 'Modifier remise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              productsState.when(
                data: (paginatedProducts) {
                  return DropdownButtonFormField<int>(
                    value: selectedProductId,
                    decoration: const InputDecoration(labelText: 'Produit'),
                    items: paginatedProducts.results
                        .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
                        .toList(),
                    onChanged: (val) => selectedProductId = val,
                    validator: (val) => val == null ? 'Veuillez choisir un produit' : null,
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => Text('Erreur chargement produits : $err'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: percentController,
                decoration: const InputDecoration(
                  labelText: '% de remise',
                  hintText: 'Par exemple : 15.00',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () async {
                final text = percentController.text.trim();
                double? percent = double.tryParse(text);
                if (selectedProductId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Veuillez choisir un produit.')),
                  );
                  return;
                }
                if (percent == null || percent < 0 || percent > 100) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Le pourcentage doit être entre 0 et 100.')),
                  );
                  return;
                }
                final notifier = ref.read(productDiscountNotifierProvider.notifier);
                try {
                  if (existing == null) {
                    final newDiscount = ProductDiscount(
                      id: 0,
                      product: selectedProductId!,
                      discountPercent: percent,
                    );
                    await notifier.createDiscount(newDiscount);
                  } else {
                    final updated = ProductDiscount(
                      id: existing.id,
                      product: selectedProductId!,
                      discountPercent: percent,
                    );
                    await notifier.updateDiscount(existing.id, updated);
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  final message = (e is DioException && e.response != null)
                      ? e.response?.data.toString() ?? e.toString()
                      : e.toString();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erreur : $message')),
                  );
                }
              },
              child: Text(existing == null ? 'Créer' : 'Enregistrer'),
            ),
          ],
        );
      },
    );

    percentController.dispose();
  }

  Future<void> _confirmDelete(int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Voulez-vous vraiment supprimer cette remise ?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    ) ??
        false;
    if (confirmed) {
      final notifier = ref.read(productDiscountNotifierProvider.notifier);
      try {
        await notifier.deleteDiscount(id);
      } catch (e) {
        final message = (e is DioException && e.response != null)
            ? e.response?.data.toString() ?? e.toString()
            : e.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur suppression : $message')),
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final discountsState = ref.watch(productDiscountNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des remises'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _currentPage = 1;
              ref.read(productDiscountNotifierProvider.notifier).load(page: 1);
            },
          ),
        ],
      ),
      body: discountsState.when(
        loading: () => const LoadingWidget(),
        error: (err, _) => ErrorDisplayWidget(error: err.toString()),
        data: (paginated) {
          final discounts = paginated.results;
          return RefreshIndicator(
            onRefresh: () async {
              _currentPage = 1;
              await ref.read(productDiscountNotifierProvider.notifier).load(page: 1);
            },
            child: ListView.separated(
              controller: _scrollController,
              itemCount: discounts.length + 1,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                if (index == discounts.length) {
                  return paginated.next != null
                      ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  )
                      : const SizedBox.shrink();
                }
                final d = discounts[index];
                return ListTile(
                  title: Text('${d.discountPercent.toStringAsFixed(2)} %'),
                  subtitle: Text(_productNames[d.product] ?? 'Produit #${d.product}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showForm(existing: d),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmDelete(d.id),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
