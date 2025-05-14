class Produit {
  final int id;
  final String nom;
  final String description;
  final double prix;
  final String imageUrl;
  final String categorie;

  Produit({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.imageUrl,
    required this.categorie,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      prix: double.parse(json['prix'].toString()),
      imageUrl: json['image_url'] ?? '',
      categorie: json['categorie'] ?? '',
    );
  }
}
