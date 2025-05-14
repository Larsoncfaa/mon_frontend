import 'package:flutter/material.dart';

class BoutonDashboard extends StatelessWidget {
  final IconData icone;
  final String texte;
  final VoidCallback onTap;

  const BoutonDashboard({
    super.key,
    required this.icone,
    required this.texte,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 32, color: Colors.blueAccent),
            const SizedBox(height: 8),
            Text(texte, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
