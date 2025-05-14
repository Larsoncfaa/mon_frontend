import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:auto_route/auto_route.dart';
import '../../widgets/champ_texte.dart';
import '../../widgets/bouton_large.dart';
import '../../app/routeur.dart';

class InscriptionEcran extends StatefulWidget {
  const InscriptionEcran({super.key});

  @override
  State<InscriptionEcran> createState() => _InscriptionEcranState();
}

class _InscriptionEcranState extends State<InscriptionEcran> {
  final _nomCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _mdpCtrl = TextEditingController();
  final FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _parler("Remplissez ce formulaire pour vous inscrire");
  }

  Future<void> _parler(String message) async {
    await tts.setLanguage('fr-FR');
    await tts.speak(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ChampTexte(
              controller: _nomCtrl,
              hintText: "Nom complet",
              icone: Icons.person,
              onFocus: () => _parler("Entrez votre nom complet"),
            ),
            const SizedBox(height: 16),
            ChampTexte(
              controller: _emailCtrl,
              hintText: "Email",
              icone: Icons.email,
              onFocus: () => _parler("Entrez votre adresse email"),
            ),
            const SizedBox(height: 16),
            ChampTexte(
              controller: _mdpCtrl,
              hintText: "Mot de passe",
              icone: Icons.lock,
              estSecret: true,
              onFocus: () => _parler("Entrez un mot de passe sécurisé"),
            ),
            const SizedBox(height: 24),
            BoutonLarge(
              texte: "Créer le compte",
              onPressed: () {
                // Inscription logique ici
                context.router.replace(const ConnexionRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
