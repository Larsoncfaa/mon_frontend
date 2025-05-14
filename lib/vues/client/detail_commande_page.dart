import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../donnees/commande.dart';
import '../../fournisseurs/commandes/commande_provider.dart';
import '../../utils/format.dart';

class DetailCommandePage extends ConsumerStatefulWidget {
  final int commandeId;
  const DetailCommandePage({Key? key, required this.commandeId}) : super(key: key);

  @override
  ConsumerState<DetailCommandePage> createState() => _DetailCommandePageState();
}

class _DetailCommandePageState extends ConsumerState<DetailCommandePage> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
  }

  Future<void> _parler(String msg) async => await _tts.speak(msg);

  @override
  Widget build(BuildContext context) {
    final cmdAsync = ref.watch(commandeProvider(widget.commandeId));

    return Scaffold(
      appBar: AppBar(title: Text('Commande #${widget.commandeId}')),
      body: cmdAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (Commande cmd) {
          _parler('Détail de la commande numéro ${cmd.id}');
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Date : ${formatDate(cmd.date)}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Total : ${formatMonnaie(cmd.total)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(height: 32),
              Text('Articles', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 8),
              ...cmd.lignes.map((ligne) => ListTile(
                title: Text(ligne.produit.nomLocalise),
                subtitle: Text('${ligne.quantite} × ${formatMonnaie(ligne.prixUnitaire)}'),
                trailing: Text(formatMonnaie(ligne.sousTotal)),
              )),
              const Divider(height: 32),
              if (cmd.invoicePdfUrl != null)
                TextButton.icon(
                  onPressed: () {
                    // ouvrir PDF
                    Navigator.pushNamed(context, '/client/commande/${cmd.id}/facture');
                  },
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text('Voir la facture PDF'),
                ),
            ],
          );
        },
      ),
    );
  }
}
