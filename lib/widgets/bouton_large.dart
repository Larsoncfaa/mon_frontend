import 'package:flutter/material.dart';

class BoutonLarge extends StatelessWidget {
  final String texte;
  final VoidCallback onPressed;

  const BoutonLarge({
    super.key,
    required this.texte,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
      ),
      child: Text(texte, style: const TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
