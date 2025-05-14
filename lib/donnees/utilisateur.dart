class Utilisateur {
  final int id;
  final String nom;
  final String email;
  final String role;

  Utilisateur({
    required this.id,
    required this.nom,
    required this.email,
    required this.role,
  });

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      id: json['id'],
      nom: json['nom'],
      email: json['email'],
      role: json['role'],
    );
  }
}
