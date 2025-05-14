import 'package:intl/intl.dart';

String formatMonnaie(double montant) {
  final f = NumberFormat.currency(locale: 'fr_FR', symbol: 'f');
  return f.format(montant);
}

String formatDate(String dateIso) {
  final date = DateTime.parse(dateIso);
  return DateFormat('dd/MM/yyyy').format(date);
}
