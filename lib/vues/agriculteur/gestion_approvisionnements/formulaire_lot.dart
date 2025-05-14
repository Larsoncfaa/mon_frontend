import 'package:flutter/material.dart';

class FormulaireLot extends StatefulWidget {
  const FormulaireLot({super.key});

  @override
  State<FormulaireLot> createState() => _FormulaireLotState();
}

class _FormulaireLotState extends State<FormulaireLot> {
  final _formKey = GlobalKey<FormState>();
  String? produitSelectionne;
  String? entrepotSelectionne;
  final TextEditingController quantiteCtrl = TextEditingController();
  DateTime? dateApprovisionnement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Créer un lot")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: produitSelectionne,
                items: [
                  const DropdownMenuItem(value: "mais", child: Text("Maïs")),
                  const DropdownMenuItem(value: "riz", child: Text("Riz")),
                ],
                decoration: const InputDecoration(
                  labelText: "Produit",
                  icon: Icon(Icons.category),
                ),
                onChanged: (value) {
                  setState(() {
                    produitSelectionne = value;
                  });
                },
                validator: (value) =>
                value == null ? "Sélectionnez un produit" : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: entrepotSelectionne,
                items: [
                  const DropdownMenuItem(value: "central", child: Text("Entrepôt Central")),
                  const DropdownMenuItem(value: "segou", child: Text("Annexe Ségou")),
                ],
                decoration: const InputDecoration(
                  labelText: "Entrepôt",
                  icon: Icon(Icons.warehouse),
                ),
                onChanged: (value) {
                  setState(() {
                    entrepotSelectionne = value;
                  });
                },
                validator: (value) =>
                value == null ? "Sélectionnez un entrepôt" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: quantiteCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Quantité (kg)",
                  icon: Icon(Icons.scale),
                ),
                validator: (value) =>
                value!.isEmpty ? "Entrez une quantité" : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.date_range),
                title: Text(dateApprovisionnement == null
                    ? "Choisir une date"
                    : "Date : ${dateApprovisionnement!.toLocal()}".split(' ')[0]),
                onTap: _choisirDate,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Enregistrer le lot"),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      dateApprovisionnement != null) {
                    // Envoi au backend
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

  void _choisirDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
    );
    if (date != null) {
      setState(() {
        dateApprovisionnement = date;
      });
    }
  }
}
