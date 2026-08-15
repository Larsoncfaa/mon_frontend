import 'utils/server_discovery.dart';

class ApiConfig {
  static String? _baseUrl;

  static String get baseUrl {
    if (_baseUrl == null) {
      throw Exception('ApiConfig n\'est pas initialisé');
    }
    return _baseUrl!;
  }

  static Future<void> initialize() async {
    const configuredUrl = String.fromEnvironment('BASE_URL');

    if (configuredUrl.isNotEmpty) {
      _baseUrl = configuredUrl;
      return;
    }

    final serverUrl = await ServerDiscovery.findServer();

    if (serverUrl == null) {
      throw Exception(
        'Serveur GestionM introuvable sur le réseau local.',
      );
    }

    _baseUrl = serverUrl;

    print('✅ Backend détecté : $_baseUrl');
  }
}