class AvisProduit {
  final int produitId;
  final int note; // 1 à 5
  final String commentaire;
  final DateTime date;

  AvisProduit({
    required this.produitId,
    required this.note,
    required this.commentaire,
    required this.date,
  });
}

class ProgrammeFidelite {
  final int clientId;
  final int points;
  final DateTime derniereMiseAJour;

  ProgrammeFidelite({
    required this.clientId,
    required this.points,
    required this.derniereMiseAJour,
  });
}
