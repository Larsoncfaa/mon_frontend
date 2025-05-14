class Livraison {
  final int id;
  final String statut;
  final String date;
  final String preuve;
  final double latitude;
  final double longitude;

  Livraison({
    required this.id,
    required this.statut,
    required this.date,
    required this.preuve,
    required this.latitude,
    required this.longitude,
  });

  factory Livraison.fromJson(Map<String, dynamic> json) {
    return Livraison(
      id: json['id'],
      statut: json['statut'],
      date: json['date'],
      preuve: json['preuve'] ?? '',
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
    );
  }
}
