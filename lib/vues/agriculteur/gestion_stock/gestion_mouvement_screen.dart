import 'package:flutter/material.dart';

class GestionMouvementScreen extends StatefulWidget {
  const GestionMouvementScreen({super.key});

  @override
  State<GestionMouvementScreen> createState() => _GestionMouvementScreenState();
}

class _GestionMouvementScreenState extends State<GestionMouvementScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _typeMouvement; // 'Entrée' ou 'Sortie'
  String? _produit;
  int _quantite = 0;
  String? _entrepot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🔄 Mouvement de stock')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Ajouter un mouvement',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _typeMouvement,
                items: ['Entrée', 'Sortie']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                decoration: const InputDecoration(
                  labelText: 'Type de mouvement',
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) => setState(() => _typeMouvement = val),
                validator: (val) => val == null ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Produit',
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) => _produit = val,
                validator: (val) =>
                val == null || val.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Entrepôt',
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) => _entrepot = val,
                validator: (val) =>
                val == null || val.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantité',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) =>
                _quantite = int.tryParse(val) ?? 0,
                validator: (val) =>
                val == null || int.tryParse(val) == null
                    ? 'Entrez un nombre'
                    : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Appel API ou provider
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('✅ Mouvement enregistré')),
                    );
                  }
                },
                icon: const Icon(Icons.sync_alt),
                label: const Text('Enregistrer le mouvement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
