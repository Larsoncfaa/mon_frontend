// lib/fournisseurs/retours/retour_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/retours.dart';
import '../repositories/retour_repository.dart';

final retoursProvider = Provider<RetourNotifier>(
      (ref) => RetourNotifier(ref.read(retourRepositoryProvider)),
);

class RetourNotifier {
  final RetourRepository _repo;
  RetourNotifier(this._repo);
  Future<void> demanderRetour(int cmdId, String motif) => _repo.postRetour(cmdId, motif);
  Future<void> demanderEchange(int cmdId, String motif) => _repo.postEchange(cmdId, motif);
  Future<void> demanderRemboursement(int cmdId, String motif) => _repo.postRemboursement(cmdId, motif);
}