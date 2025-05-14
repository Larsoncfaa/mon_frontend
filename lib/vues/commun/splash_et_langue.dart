import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:auto_route/auto_route.dart';
import '../../app/routeur.dart'; // Assure-toi que le routeur est bien défini

class SplashEtLangue extends StatelessWidget {
  const SplashEtLangue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 150),
              const SizedBox(height: 40),
              Text(
                'Choisissez votre langue',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: const [
                  _BoutonLangue(code: 'fr-FR', label: 'Français', image: 'fr.png'),
                  _BoutonLangue(code: 'en-US', label: 'English', image: 'en.png'),
                  _BoutonLangue(code: 'bm', label: 'Bambara', image: 'ml.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BoutonLangue extends StatelessWidget {
  final String code;
  final String label;
  final String image;

  const _BoutonLangue({
    required this.code,
    required this.label,
    required this.image,
  });

  Future<void> _onSelectLangue(BuildContext context) async {
    final tts = FlutterTts();
    await tts.setLanguage(code);
    await tts.setSpeechRate(0.5);
    await tts.speak('Bienvenue, veuillez vous connecter');

    // Attente avant navigation
    await Future.delayed(const Duration(seconds: 3));

    // Navigue vers l'écran de connexion
    if (context.mounted) {
      context.router.replace(const ConnexionRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _onSelectLangue(context),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        backgroundColor: Colors.green[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      icon: Image.asset('assets/images/$image', width: 32, height: 32),
      label: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}
