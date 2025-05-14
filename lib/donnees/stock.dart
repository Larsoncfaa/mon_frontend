class StockLevel {
  final int produitId;
  final int quantite;
  final String entrepot;
  final DateTime date;

  StockLevel({
    required this.produitId,
    required this.quantite,
    required this.entrepot,
    required this.date,
  });
}

class MouvementStock {
  final int produitId;
  final String type; // "entrée" ou "sortie"
  final int quantite;
  final DateTime date;
  final String? commentaire;

  MouvementStock({
    required this.produitId,
    required this.type,
    required this.quantite,
    required this.date,
    this.commentaire,
  });
}

class AlerteStock {
  final int produitId;
  final int seuil;
  final bool estActive;

  AlerteStock({
    required this.produitId,
    required this.seuil,
    required this.estActive,
  });
}
