class DemandeRetour {
  final int commandeId;
  final String raison;
  final DateTime dateDemande;

  DemandeRetour({
    required this.commandeId,
    required this.raison,
    required this.dateDemande,
  });
}

class DemandeEchange {
  final int commandeId;
  final int nouveauProduitId;
  final String raison;

  DemandeEchange({
    required this.commandeId,
    required this.nouveauProduitId,
    required this.raison,
  });
}

class DemandeRemboursement {
  final int commandeId;
  final String raison;
  final DateTime date;

  DemandeRemboursement({
    required this.commandeId,
    required this.raison,
    required this.date,
  });
}
