class Commande {
  final int id;
  final String statut;
  final String date;
  final List<LigneCommande> lignes;

  Commande({
    required this.id,
    required this.statut,
    required this.date,
    required this.lignes,
  });

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
      id: json['id'],
      statut: json['statut'],
      date: json['date'],
      lignes: (json['lignes'] as List<dynamic>)
          .map((e) => LigneCommande.fromJson(e))
          .toList(),
    );
  }
}

class LigneCommande {
  final int produitId;
  final String nomProduit;
  final int quantite;
  final double prix;

  LigneCommande({
    required this.produitId,
    required this.nomProduit,
    required this.quantite,
    required this.prix,
  });

  factory LigneCommande.fromJson(Map<String, dynamic> json) {
    return LigneCommande(
      produitId: json['produit_id'],
      nomProduit: json['nom_produit'],
      quantite: json['quantite'],
      prix: double.parse(json['prix'].toString()),
    );
  }
}
