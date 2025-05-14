import 'package:flutter_tts/flutter_tts.dart';

class AudioHelper {
  final FlutterTts _tts = FlutterTts();

  Future<void> parler(String texte, {String locale = 'fr-FR'}) async {
    await _tts.setLanguage(locale);
    await _tts.setSpeechRate(0.5);
    await _tts.speak(texte);
  }
}
