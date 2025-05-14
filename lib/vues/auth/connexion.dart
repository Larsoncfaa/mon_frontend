import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:auto_route/auto_route.dart';
import '../../widgets/champ_texte.dart';
import '../../widgets/bouton_large.dart';
import '../../app/routeur.dart';

class ConnexionEcran extends StatefulWidget {
  const ConnexionEcran({super.key});

  @override
  State<ConnexionEcran> createState() => _ConnexionEcranState();
}

class _ConnexionEcranState extends State<ConnexionEcran> {
  final _emailCtrl = TextEditingController();
  final _mdpCtrl = TextEditingController();
  final FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _parler("Veuillez entrer votre email et mot de passe");
  }

  Future<void> _parler(String message) async {
    await tts.setLanguage('fr-FR');
    await tts.speak(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
              onFocus: () => _parler("Entrez votre mot de passe"),
            ),
            const SizedBox(height: 24),
            BoutonLarge(
              texte: "Se connecter",
              onPressed: () {
                // Connexion logique ici
                context.router.replace(const TableauDeBordClientRoute());
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.router.push(const InscriptionRoute()),
              child: const Text("Créer un compte"),
            )
          ],
        ),
      ),
    );
  }
}
