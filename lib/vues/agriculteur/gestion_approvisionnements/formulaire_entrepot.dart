import 'package:flutter/material.dart';

class FormulaireEntrepot extends StatefulWidget {
  final bool estEdition;

  const FormulaireEntrepot({super.key, this.estEdition = false});

  @override
  State<FormulaireEntrepot> createState() => _FormulaireEntrepotState();
}

class _FormulaireEntrepotState extends State<FormulaireEntrepot> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomCtrl = TextEditingController();
  final TextEditingController adresseCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.estEdition ? "Modifier l’entrepôt" : "Nouvel entrepôt"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomCtrl,
                decoration: const InputDecoration(
                  labelText: "Nom de l’entrepôt",
                  icon: Icon(Icons.warehouse),
                ),
                validator: (value) =>
                value!.isEmpty ? "Veuillez entrer un nom" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: adresseCtrl,
                decoration: const InputDecoration(
                  labelText: "Adresse",
                  icon: Icon(Icons.location_on),
                ),
                validator: (value) =>
                value!.isEmpty ? "Veuillez entrer une adresse" : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Enregistrer"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Enregistrement backend
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
