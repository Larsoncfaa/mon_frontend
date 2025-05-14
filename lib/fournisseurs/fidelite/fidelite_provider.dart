// lib/fournisseurs/fidelite/fidelite_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/avis_fidelite.dart';
import '../repositories/fidelite_repository.dart';

final fideliteProvider = FutureProvider<ProgrammeFidelite>(
      (ref) => ref.read(fideliteRepositoryProvider).fetchPoints(),
);