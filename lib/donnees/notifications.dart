class NotificationSysteme {
  final int id;
  final String titre;
  final String message;
  final bool estLue;
  final DateTime date;

  NotificationSysteme({
    required this.id,
    required this.titre,
    required this.message,
    required this.estLue,
    required this.date,
  });
}
