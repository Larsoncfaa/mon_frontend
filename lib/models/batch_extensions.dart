// lib/models/batch_extensions.dart
import 'batch.dart';

extension BatchCreateJson on Batch {
  /// Génère un Map<String, dynamic> pour un POST, sans inclure l'id à 0.
  Map<String, dynamic> toCreateJson() {
    return {
      'product': product,
      'lot_number': lotNumber,
      // Si votre backend attend "YYYY-MM-DD" sans l’heure, on peut tronquer :
      'expiration_date': expirationDate.toIso8601String().split('T').first,
      // Si vous avez ajouté un champ quantity dans le modèle, ajoutez-le ici :
      // 'quantity': quantity,
    };
  }
}
