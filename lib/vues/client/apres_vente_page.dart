import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../donnees/commande.dart';
import '../../fournisseurs/commandes/commande_provider.dart';
import '../../fournisseurs/retours/retour_provider.dart';
import '../../widgets/bouton_large.dart';

enum TypeApresVente { retour, echange, remboursement }

class ApresVentePage extends ConsumerStatefulWidget {
  final Commande commande;
  const ApresVentePage({Key? key, required this.commande}) : super(key: key);

  @override
  ConsumerState<ApresVentePage> createState() => _ApresVentePageState();
}

class _ApresVentePageState extends ConsumerState<ApresVentePage> {
  final FlutterTts _tts = FlutterTts();
  TypeApresVente? _type;
  String _motif = '';

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
    _tts.speak('Vous pouvez demander un retour, un échange ou un remboursement.');
  }

  Future<void> _parler(String msg) async => await _tts.speak(msg);

  void _soumettre() {
    if (_type == null || _motif.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez choisir un type et indiquer un motif')));
      return;
    }
    // Appel selon le type
    switch (_type!) {
      case TypeApresVente.retour:
        ref.read(retourProvider.notifier).demanderRetour(widget.commande.id, _motif);
        break;
      case TypeApresVente.echange:
        ref.read(retourProvider.notifier).demanderEchange(widget.commande.id, _motif);
        break;
      case TypeApresVente.remboursement:
        ref.read(retourProvider.notifier).demanderRemboursement(widget.commande.id, _motif);
        break;
    }
    _parler('Votre demande a été envoyée');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Après-vente')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Commande #${widget.commande.id}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text('Type de demande', style: Theme.of(context).textTheme.subtitle1),
            ListTile(
              title: const Text('Retour'),
              leading: Radio<TypeApresVente>(
                value: TypeApresVente.retour,
                groupValue: _type,
                onChanged: (v) { setState(() => _type = v); _parler('Retour'); },
              ),
            ),
            ListTile(
              title: const Text('Échange'),
              leading: Radio<TypeApresVente>(
                value: TypeApresVente.echange,
                groupValue: _type,
                onChanged: (v) { setState(() => _type = v); _parler('Échange'); },
              ),
            ),
            ListTile(
              title: const Text('Remboursement'),
              leading: Radio<TypeApresVente>(
                value: TypeApresVente.remboursement,
                groupValue: _type,
                onChanged: (v) { setState(() => _type = v); _parler('Remboursement'); },
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Motif de votre demande',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => _motif = v,
              onTap: () => _parler('Saisissez le motif de votre demande'),
            ),
            const Spacer(),
            BoutonLarge(texte: 'Envoyer la demande', onPressed: _soumettre),
          ],
        ),
      ),
    );
  }
}
