// providers/current_user_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Exemple : on retourne en dur l'ID de l’agriculteur connecté
/// Dans la vraie appli, on utiliserait un AuthRepository pour extraire
/// l’ID depuis le token JWT ou un endpoint `/me/`.
final currentUserIdProvider = Provider<int>((ref) {
  return 5; // Remplace par la logique réelle pour récupérer l’ID
});
