// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'app/localisations.dart';
import 'app/audio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialise le service audio globalement si nécessaire
  final audio = AudioService();
  await audio.init(locale: 'fr-FR');

  runApp(
    ProviderScope(
      child: MyApp(audioService: audio),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AudioService audioService;
  const MyApp({super.key, required this.audioService});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MaterialApp.router(
      title: 'AgriCommerce',
      routerConfig: _appRouter,
      theme: appTheme,
      debugShowCheckedModeBanner: false,

      // Localisation
      supportedLocales: LocalisationConfig.supportedLocales,
      localizationsDelegates: LocalisationConfig.localizationsDelegates,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          for (var supported in supportedLocales) {
            if (supported.languageCode == locale.languageCode) {
              return supported;
            }
          }
        }
        return supportedLocales.first;
      },

      // Aide à l'accessibilité : synthèse vocale au changement de routes
      builder: (context, router) {
        // Par exemple, lire un message générique à chaque nouvelle page
        return router!;
      },
    );
  }
}
