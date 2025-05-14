class CodePromo {
  final String code;
  final double reductionPourcent;
  final DateTime dateExpiration;

  CodePromo({
    required this.code,
    required this.reductionPourcent,
    required this.dateExpiration,
  });
}

class RemiseProduit {
  final int produitId;
  final double reductionPourcent;
  final DateTime dateDebut;
  final DateTime dateFin;

  RemiseProduit({
    required this.produitId,
    required this.reductionPourcent,
    required this.dateDebut,
    required this.dateFin,
  });
}
