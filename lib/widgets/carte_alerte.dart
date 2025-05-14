import 'package:flutter/material.dart';

class CarteAlerte extends StatelessWidget {
  final String message;
  final String date;

  const CarteAlerte({super.key, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade50,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.warning, color: Colors.red),
        title: Text(message),
        subtitle: Text(date),
      ),
    );
  }
}
