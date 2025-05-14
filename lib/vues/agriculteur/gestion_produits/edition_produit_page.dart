

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../donnees/produit.dart';
import '../../../fournisseurs_etats/produits/produit_form_provider.dart';
import '../../../fournisseurs_etats/produits/categorie_provider.dart';

class EditionProduitPage extends ConsumerStatefulWidget {
  final Produit? produit; // null pour ajout, non-null pour édition
  const EditionProduitPage({Key? key, this.produit}) : super(key: key);

  @override
  ConsumerState<EditionProduitPage> createState() => _EditionProduitPageState();
}

class _EditionProduitPageState extends ConsumerState<EditionProduitPage> {
  final _formKey = GlobalKey<FormState>();
  final FlutterTts _tts = FlutterTts();

  late TextEditingController _nomFr;
  late TextEditingController _nomEn;
  late TextEditingController _nomBm;
  late TextEditingController _descFr;
  late TextEditingController _descEn;
  late TextEditingController _descBm;
  late TextEditingController _prixCtrl;
  File? _imageFile;
  int? _categorieId;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
    final p = widget.produit;
    _nomFr = TextEditingController(text: p?.nomFr ?? '');
    _nomEn = TextEditingController(text: p?.nomEn ?? '');
    _nomBm = TextEditingController(text: p?.nomBm ?? '');
    _descFr = TextEditingController(text: p?.descFr ?? '');
    _descEn = TextEditingController(text: p?.descEn ?? '');
    _descBm = TextEditingController(text: p?.descBm ?? '');
    _prixCtrl = TextEditingController(text: p?.prix.toString() ?? '');
    _categorieId = p?.categorieId;
    // charger catégories
    ref.read(categorieProvider.notifier).loadCategories();
  }

  @override
  void dispose() {
    _tts.stop();
    _nomFr.dispose();
    _nomEn.dispose();
    _nomBm.dispose();
    _descFr.dispose();
    _descEn.dispose();
    _descBm.dispose();
    _prixCtrl.dispose();
    super.dispose();
  }

  Future<void> _parler(String msg) async => await _tts.speak(msg);

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _imageFile = File(image.path));
      _parler('Image sélectionnée');
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate() || _categorieId == null) {
      _parler('Veuillez remplir tous les champs');
      return;
    }
    final data = {
      'nom_fr': _nomFr.text,
      'nom_en': _nomEn.text,
      'nom_bm': _nomBm.text,
      'desc_fr': _descFr.text,
      'desc_en': _descEn.text,
      'desc_bm': _descBm.text,
      'prix': double.parse(_prixCtrl.text),
      'categorie_id': _categorieId!,
      'image': _imageFile, // géré par le provider
    };
    final notifier = ref.read(produitFormProvider.notifier);
    notifier.saveProduit(widget.produit?.id, data).then((success) {
      if (success) {
        _parler('Produit enregistré avec succès');
        Navigator.pop(context);
      } else {
        _parler('Échec de l\'enregistrement');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final catsAsync = ref.watch(categorieProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produit == null ? 'Ajouter un produit' : 'Éditer le produit'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Image + bouton
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: _imageFile != null
                    ? Image.file(_imageFile!, height: 150, fit: BoxFit.cover)
                    : Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Champs de texte multilingues
            ...[
              {'ctrl': _nomFr, 'hint': 'Nom (FR)'},
              {'ctrl': _nomEn, 'hint': 'Nom (EN)'},
              {'ctrl': _nomBm, 'hint': 'Nom (BM)'},
            ].map((e) => TextFormField(
              controller: e['ctrl'] as TextEditingController,
              decoration: InputDecoration(labelText: e['hint']),
              onTap: () => _parler(e['hint']!),
              validator: (v) => v == null || v.isEmpty ? 'Obligatoire' : null,
            )),
            const SizedBox(height: 12),
            ...[
              {'ctrl': _descFr, 'hint': 'Description (FR)'},
              {'ctrl': _descEn, 'hint': 'Description (EN)'},
              {'ctrl': _descBm, 'hint': 'Description (BM)'},
            ].map((e) => TextFormField(
              controller: e['ctrl'] as TextEditingController,
              decoration: InputDecoration(labelText: e['hint']),
              maxLines: 2,
              onTap: () => _parler(e['hint']!),
              validator: (v) => v == null || v.isEmpty ? 'Obligatoire' : null,
            )),
            const SizedBox(height: 12),

            // Prix
            TextFormField(
              controller: _prixCtrl,
              decoration: const InputDecoration(
                labelText: 'Prix (€)',
                prefixIcon: Icon(Icons.euro_symbol),
              ),
              keyboardType: TextInputType.number,
              onTap: () => _parler('Prix'),
              validator: (v) => v == null || double.tryParse(v) == null ? 'Prix invalide' : null,
            ),
            const SizedBox(height: 12),

            // Sélecteur de catégorie
            catsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erreur catégories'),
              data: (cats) => DropdownButtonFormField<int>(
                value: _categorieId,
                decoration: const InputDecoration(labelText: 'Catégorie'),
                items: cats
                    .map((c) => DropdownMenuItem(value: c.id, child: Text(c.nomLocalise)))
                    .toList(),
                onChanged: (v) {
                  setState(() => _categorieId = v);
                  _parler('Catégorie sélectionnée');
                },
                validator: (v) => v == null ? 'Sélectionner une catégorie' : null,
              ),
            ),
            const SizedBox(height: 24),

            // Aperçu QR-code
            if (widget.produit?.id != null)
              Center(
                child: QrImage(
                  data: widget.produit!.id.toString(),
                  size: 120,
                ),
              ),
            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.save),
              label: Text(widget.produit == null ? 'Ajouter' : 'Enregistrer'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
