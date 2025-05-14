// lib/vues/client/paiement_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/bouton_large.dart';
import '../../utils/format.dart';
import '../../fournisseurs/commandes/commande_provider.dart';

class PaiementPage extends ConsumerStatefulWidget {
  final int commandeId;
  const PaiementPage({Key? key, required this.commandeId}) : super(key: key);

  @override
  ConsumerState<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends ConsumerState<PaiementPage> {
  final FlutterTts _tts = FlutterTts();
  bool _enCours = false;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
    _tts.speak('Montant à payer');
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _parler(String msg) async {
    await _tts.speak(msg);
  }

  Future<void> _effectuerPaiement(double montant) async {
    setState(() => _enCours = true);
    _parler('Paiement en cours, veuillez patienter');
    final success = await ref
        .read(commandeProvider.notifier)
        .payerCommande(widget.commandeId);
    if (success) {
      _parler('Paiement réussi');
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/client/commandes');
      }
    } else {
      _parler('Échec du paiement');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Le paiement a échoué')),
        );
      }
    }
    setState(() => _enCours = false);
  }

  @override
  Widget build(BuildContext context) {
    final commande = ref.watch(commandeProvider(widget.commandeId));
    final montant = commande?.total ?? 0.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Paiement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Montant à payer',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            Text(
              formatMonnaie(montant),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: _enCours
                    ? const SpinKitFadingCircle(size: 60)
                    : Image.asset('assets/images/payment_illu.png', width: 200),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: BoutonLarge(
                texte: _enCours ? 'Patientez...' : 'Payer Maintenant',
                onPressed: _enCours ? null : () => _effectuerPaiement(montant),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
