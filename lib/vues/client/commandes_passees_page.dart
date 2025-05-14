// lib/vues/client/commandes_passees_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/bouton_dashboard.dart';
import '../../donnees/commande.dart';
import '../../fournisseurs/commandes/commande_provider.dart';
import '../../utils/format.dart';
import 'package:url_launcher/url_launcher.dart';

class CommandesPasseesPage extends ConsumerStatefulWidget {
  const CommandesPasseesPage({super.key});

  @override
  ConsumerState<CommandesPasseesPage> createState() => _CommandesPasseesPageState();
}

class _CommandesPasseesPageState extends ConsumerState<CommandesPasseesPage> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
    _tts.speak('Voici vos commandes passées');
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _lire(String msg) async {
    await _tts.speak(msg);
  }

  @override
  Widget build(BuildContext context) {
    final commandesAsync = ref.watch(listeCommandesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes commandes')),
      body: commandesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (List<Commande> commandes) {
          if (commandes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Aucune commande passée', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 16),
                  BoutonDashboard(
                    icone: Icons.store,
                    texte: 'Voir le catalogue',
                    onTap: () {
                      _lire('Retour au catalogue');
                      Navigator.pushNamed(context, '/client/catalogue');
                    },
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: commandes.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (ctx, i) {
              final cmd = commandes[i];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  title: Text('Commande #${cmd.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Date : ${formatDate(cmd.date)}\nTotal : ${formatMonnaie(cmd.total)}'),
                  isThreeLine: true,
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == 'facture') {
                        final url = cmd.invoicePdfUrl;
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      }
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: 'facture',
                        child: Text('Voir facture PDF'),
                      ),
                    ],
                  ),
                  onTap: () {
                    _lire('Détails de la commande numéro ${cmd.id}');
                    Navigator.pushNamed(context, '/client/commande/${cmd.id}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
