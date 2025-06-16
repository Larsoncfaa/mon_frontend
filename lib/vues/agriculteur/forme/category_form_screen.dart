import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/category_provider.dart';
import '../../../models/category.dart';


/// Écran pour lister/ajouter/éditer/supprimer les catégories.
class CategoryManagementScreen extends ConsumerWidget {
  const CategoryManagementScreen({super.key});

  Future<void> _showCategoryForm(
      BuildContext context,
      WidgetRef ref, {
        Category? categoryToEdit,
      }) async {
    final nameCtrl = TextEditingController(text: categoryToEdit?.name ?? '');

    final result = await showDialog<String?>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          categoryToEdit == null ? 'Nouvelle catégorie' : 'Modifier catégorie',
        ),
        content: TextFormField(
          controller: nameCtrl,
          decoration: const InputDecoration(labelText: 'Nom de la catégorie'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final text = nameCtrl.text.trim();
              if (text.isNotEmpty) {
                Navigator.of(context).pop(text);
              }
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );

    if (result != null) {
      final notifier = ref.read(categoryNotifierProvider.notifier);
      if (categoryToEdit == null) {
        await notifier.addCategory(Category(id: 0, name: result));
      } else {
        await notifier.updateCategory(
          Category(id: categoryToEdit.id, name: result),
        );
      }
      await notifier.loadCategories();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des catégories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(categoryNotifierProvider.notifier).loadCategories(),
          ),
        ],
      ),
      body: categoryState.when(
        data: (cats) => ListView.separated(
          itemCount: cats.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final cat = cats[index];
            return ListTile(
              title: Text(cat.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _showCategoryForm(context, ref, categoryToEdit: cat),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => ref.read(categoryNotifierProvider.notifier).removeCategory(cat.id),
                  ),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCategoryForm(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }
}
