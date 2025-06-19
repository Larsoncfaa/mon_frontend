import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fournisseurs/provider/delivery_person_provider.dart';
import '../../../models/delivery_person.dart';
import '../../../widgets/loading_widget.dart';

class CreateDeliveryPersonScreen extends ConsumerStatefulWidget {
  const CreateDeliveryPersonScreen({super.key});

  @override
  ConsumerState<CreateDeliveryPersonScreen> createState() => _CreateDeliveryPersonScreenState();
}

class _CreateDeliveryPersonScreenState extends ConsumerState<CreateDeliveryPersonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _userIdController = TextEditingController();
  final _agriculteurIdController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _userIdController.dispose();
    _agriculteurIdController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final userId = int.tryParse(_userIdController.text);
      final agriculteurId = int.tryParse(_agriculteurIdController.text);
      final phone = _phoneController.text;

      if (userId == null || agriculteurId == null || phone.isEmpty) {
        throw Exception('Champs invalides');
      }

      final payload = {
        "user": userId,
        "agriculteur": agriculteurId,
        "phone": phone,
      };

      await ref.read(deliveryPersonNotifierProvider.notifier).createDeliveryPerson(payload);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Livreur créé avec succès')),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      debugPrint('Erreur création livreur: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur : ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouveau Livreur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Téléphone'),
                validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _userIdController,
                decoration: const InputDecoration(labelText: 'ID utilisateur lié'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _agriculteurIdController,
                decoration: const InputDecoration(labelText: 'ID agriculteur'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _isSubmitting ? null : _submit,
                icon: const Icon(Icons.save),
                label: _isSubmitting
                    ? const LoadingWidget()
                    : const Text('Créer le livreur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
