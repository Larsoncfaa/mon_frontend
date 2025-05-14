// lib/vues/agriculteur/tableau_de_bord_agriculteur.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../donnees/stock.dart';
import '../../../fournisseurs_etats/stock/stock_provider.dart';

class TableauDeBordAgriculteur extends ConsumerStatefulWidget {
  const TableauDeBordAgriculteur({Key? key}) : super(key: key);

  @override
  ConsumerState<TableauDeBordAgriculteur> createState() => _TableauDeBordAgriculteurState();
}

class _TableauDeBordAgriculteurState extends ConsumerState<TableauDeBordAgriculteur> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('fr-FR');
    _tts.speak('Bienvenue sur votre tableau de bord agriculteur');
    ref.read(stockLevelProvider.notifier).loadStockLevels();
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _parler(String msg) async => await _tts.speak(msg);

  @override
  Widget build(BuildContext context) {
    final niveauxAsync = ref.watch(stockLevelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tableau de bord Agriculteur')),
      body: niveauxAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (niveaux) {
          if (niveaux.isEmpty) {
            return const Center(child: Text('Aucun produit en stock'));
          }

          // Préparer les données pour le graphique
          final maxQuantite = niveaux.map((n) => n.quantite.toDouble()).reduce((a, b) => a > b ? a : b) + 5;
          final barGroups = niveaux.asMap().entries.map((entry) {
            final idx = entry.key;
            final niveau = entry.value;
            return BarChartGroupData(
              x: idx,
              barRods: [BarChartRodData(toY: niveau.quantite.toDouble(), width: 20)],
              showingTooltipIndicators: [0],
            );
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Niveaux de stock', style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: BarChart(
                    BarChartData(
                      maxY: maxQuantite,
                      barGroups: barGroups,
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index < niveaux.length) {
                                final nom = niveaux[index].produitNom;
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    nom.length > 8 ? '${nom.substring(0, 8)}…' : nom,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add_circle_outline),
                      label: const Text('Ajouter produit'),
                      onPressed: () {
                        _parler('Ajouter un produit');
                        Navigator.pushNamed(context, '/agriculteur/ajout_produit');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.qr_code_scanner),
                      label: const Text('Scanner QR'),
                      onPressed: () {
                        _parler('Scanner un QR code');
                        Navigator.pushNamed(context, '/agriculteur/scan_qr');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
